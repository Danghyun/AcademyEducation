import 'uni_platform_unknown.dart';

/* 동일한 의미의 코드
기본을 네이티브용 빌드라고 가정하여 네이티브 플랫폼용 코드를 내보내고,
웹 플랫폼용 빌드라고 판단될 경우 웹 플랫폼용 코드를 내보낸다.

export 'uni_platform_natvie.dart'
    if(dart.library.html) 'uni_platform_web.dart'
*/

// library 키워드는 사용할 수 없다.
export 'uni_platform_unknown.dart'
    if (dart.library.io) 'uni_platform_native.dart'
    if (dart.library.html) 'uni_platform_web.dart';

// 객체 생성 함수
UniPlatform createUniPlatform() => UniPlatformImpl();

// 구현 제약 클래스
abstract class UniPlatform {
  bool isNative();

  bool isWeb();

  bool get isAndroid;
  bool get isIOS;
  bool get isWindows;
  bool get isMacOS;
  bool get isLinux;
  bool get isFuchsia;
}
