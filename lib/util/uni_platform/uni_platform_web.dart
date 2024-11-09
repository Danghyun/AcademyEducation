// uni_platform_web.dart : 웹 플랫폼용 코드

import 'dart:html'; // 네이티브 플랫폼에서 이 파일을 불러올 경우 에러 발생
import 'uni_platform.dart';

class UniPlatformImpl extends UniPlatform {
  @override
  bool isNative() => false;

  @override
  bool isWeb() => true;

  @override
  bool get isAndroid => false;

  @override
  bool get isIOS => false;

  @override
  bool get isWindows => false;

  @override
  bool get isMacOS => false;

  @override
  bool get isLinux => false;

  @override
  bool get isFuchsia => false;
}
