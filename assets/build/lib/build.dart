import 'dart:async';
import 'dart:io';

import 'package:build/build.dart';
import 'package:build_runner_core/build_runner_core.dart' as core;

// import 'package:file/file.dart' as file;
import 'package:file/local.dart' as local;
import 'package:glob/glob.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as p;

Builder pubspecBuilder(BuilderOptions options) => PubspecBuilder(options);

class PubspecBuilder implements Builder {
  PubspecBuilder(
      BuilderOptions options,
      )   : buildExtensions = _parseBuildExtensions(options.config),
        target = _parseTarget(options.config);

  final String target;
  final Map<String, List<String>> buildExtensions;

  static String _parseTarget(
      Map<String, dynamic> config,
      ) {
    String target = config['target'] as String? ?? 'spec/build.pubspec.yaml';
    return target;
  }

  static Map<String, List<String>> _parseBuildExtensions(
      Map<String, dynamic> config,
      ) {
    final extensions = (config['build_extensions'] as Map<String, dynamic>?) ??
        {
          '.yaml': ['.generated.yaml']
        };
    return extensions.map(
          (key, value) => MapEntry(key, List<String>.from(value as List)),
    );
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final assetId = buildStep.inputId;
    print(">>>> BUILD: ${this.target}");

    // target 파일에서 sources 읽어오기
    // 현재 위치 : PackageGraph 기반 조사
    final packageGraph = await core.PackageGraph.forThisPackage();
    final packageRootDir = Directory(packageGraph.root.path);
    // // 현재 위치 : 현재 스크립트의 위치로부터 패키지의 루트 디렉토리 추정
    // final scriptDir = p.dirname(Platform.script.toFilePath()); // script 동작 시 디렉토리
    // final scriptDir = File(Platform.script.toFilePath()).parent;
    // final packageRootDir = p.dirname(p.dirname(scriptDir)); // 현재 패키지의 루트 디렉토리 계산
    final target = "${packageRootDir.path}/${this.target}";
    print("\t[INFO] 병합 대상 파일들 조사 중...");
    final buildYamlPath = await File(target);

    // build.yaml 파일에서 sources 읽어오기
    if (!await buildYamlPath.exists()) {
      print("\t[ERROR] 병합 대상 파일들 조사 중 실패(원인: 파일 찾기 실패, $target)");
      return;
    }
    print("\t[INFO] 병합 대상 파일들 조사 완료");

    final buildYamlContent = await buildYamlPath.readAsString();
    final buildYamlMap = loadYaml(buildYamlContent) as YamlMap;
    final targets = buildYamlMap['targets'] as YamlMap;
    final defaultTarget = targets['\$default'] as YamlMap;
    final sources = defaultTarget['sources'] as List<dynamic>;

    // sources 목록에서 .yaml 파일만 필터링 및 데이터 병합
    final yamlString = StringBuffer();
    for (var source in sources) {
      if (source.endsWith('.yaml')) {
        final file = File(source);
        if (!await file.exists()) {
          continue;
        }
        print("\t[INFO] $source 파일을 불러오는 중");
        await _appendYamlFileContent(file: file, buffer: yamlString);
      } else {
        final files = await _findYamlFiles(pattern: source);
        for (var file in files) {
          await _appendYamlFileContent(file: file, buffer: yamlString);
        }
      }
    }

    // 병합된 데이터를 YAML 형식으로 변환
    // final yamlWriter = YamlWriter();
    // String yamlString = yamlWriter.write(mergedData);
    // yamlString = yamlString.replaceAllMapped(RegExp('''\'"(.*?)"\'''', dotAll: true), (match) {
    //   return match.group(1) ?? '';
    // });

    // // 병합된 YAML 데이터 파일 쓰기 + 현재 패키지에 출력 파일 경로 지정 : 현재 디렉토리(/assets/build/)에 pubspec.generated.yaml
    // // final outputId = assetId.changeExtension('.generated.yaml');
    // // print(outputId.path);
    // await buildStep.writeAsString(outputId, yamlString);
    // log.info('Generated file: ${outputId.path}'); // INFO 로그 레벨 사용

    // 병합된 YAML 데이터 파일 쓰기 + 루트 패키지에 출력 파일 경로 지정 : 현재 디렉토리(/assets/build/)의 루트 디렉토리(/)에 pubspec.yaml 파일 경로 설정
    final fileSystem = const local.LocalFileSystem();
    final rootPath = p.absolute(p.join(Directory.current.path, '..', '..'));
    final outputPath = p.join(rootPath, 'pubspec.yaml');
    final outputFile = fileSystem.file(outputPath);
    // 파일이 존재하는지 확인 및 존재할 경우 삭제
    if (await outputFile.exists()) {
      await outputFile.delete();
      print('\t[INFO] 기존 pubspec.yaml 파일 삭제 중 ${outputFile.path}');
    }
    // 병합된 YAML 데이터 파일 쓰기
    await outputFile.writeAsString(yamlString.toString());
    print('>>>> BUILD: END: ${outputFile.path}'); // INFO 로그 레벨 사용
  }

  // 파일을 있는 그대로 읽음
  Future<void> _appendYamlFileContent({
    required File file,
    required StringBuffer buffer,
  }) async {
    final content = await file.readAsString();
    buffer.writeln(content);
  }

  // yaml 파일 탐색
  Future<List<File>> _findYamlFiles({
    required String pattern,
  }) async {
    final packageGraph = await core.PackageGraph.forThisPackage();
    final packageRoot = packageGraph.root.path;
    final glob = Glob(pattern);
    final files = <File>[];
    final fileSystem = const local.LocalFileSystem();
    await for (var entity in await glob.listFileSystem(
      fileSystem,
      root: packageRoot,
    )) {
      if (!(entity is File)) {
        continue;
      }
      File file = entity as File;
      if (!entity.path.endsWith('.yaml')) {
        continue;
      }
      files.add(file);
    }

    return files;
  }
}