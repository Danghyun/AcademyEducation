// uni_platform_native.dart : 네이티브 플랫폼용 코드

import 'dart:io'; // 웹 플랫폼에서 이 파일을 불러올 경우 에러 발생
// dart:io 내부의 Platform 클래스만 불러오기
import 'dart:io' show Platform;
import 'uni_platform.dart';

class UniPlatformImpl extends UniPlatform {
  @override
  bool isNative() => true;

  @override
  bool isWeb() => false;

  @override
  bool get isAndroid => Platform.isAndroid;

  @override
  bool get isIOS => Platform.isIOS;

  @override
  bool get isWindows => Platform.isWindows;

  @override
  bool get isMacOS => Platform.isMacOS;

  @override
  bool get isLinux => Platform.isLinux;

  @override
  bool get isFuchsia => Platform.isFuchsia;
}
