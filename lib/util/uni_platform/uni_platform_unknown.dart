// uni_platform_unknown.dart : 플랫폼이 식별되지 않았을 때 실행할 코드

import 'uni_platform.dart';

class UniPlatformImpl extends UniPlatform {
  @override
  bool isNative() {
    // or throw UnimplementedError();
    throw UnsupportedError('[uni_platform_web.dart] UniPlatformImpl.isNative');

    // 에러 처리를 하고 싶지 않은 경우 throw 대신 return 처리한다
    // return false;
  }

  @override
  bool isWeb() {
    // or throw UnimplementedError();
    throw UnsupportedError('[uni_platform_web.dart] UniPlatformImpl.isWeb ');

    // 에러 처리를 하고 싶지 않은 경우 throw 대신 return 처리한다
    // return false;
  }

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
