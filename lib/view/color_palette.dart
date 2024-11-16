import 'dart:ui';

class ColorPalette {
  /// Color.fromARGB : (0/0x00 ~ 255/0xFF), Alpha (0 ~ 255)
  /// Color.fromRGBO : (0/0x00 ~ 255/0xFF), Opacity (0.0 ~ 1.0)

  /// 주 색상 (primary)
  static const main = Color.fromRGBO(0xFF, 0xFF, 0xFF, 1.0);

  /// 보조 색상 (secondary)
  static const sub = Color.fromRGBO(0x00, 0xFf, 0x00, 1.0);

  /// 배경 색상
  static const background = Color.fromRGBO(0xef, 0xef, 0xef, 1.0);

  /// 배경 위의 텍스트 색상
  static const backgroundOn = Color.fromRGBO(0x00, 0x00, 0x00, 1.0);
}