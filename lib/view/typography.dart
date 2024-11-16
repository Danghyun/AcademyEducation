import 'package:flutter/painting.dart';
import 'package:education/view/color_palette.dart';

class Typography {
  static const mid =  TextStyle(
    color: ColorPalette.backgroundOn,
    fontSize: 15,
    fontWeight: FontWeight.normal,
    // 폰트를 가져오는 위치
    // - 디바이스 내에서 가져오는 폰트 패밀리
    // - 프로젝트 에셋에 넣어둔 폰트 패밀리
    // fontFamily: '',
    decoration: TextDecoration.none,
  );

  final midBold = mid.copyWith(
    fontWeight: FontWeight.bold,
  );
}

// copyWith 관례 메소드가 없는 경우 : extension 문법으로 구현
