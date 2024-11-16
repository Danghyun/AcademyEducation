import 'package:education/view/typography.dart';
import 'package:education/widgets/my.widgets.dart';
import 'package:flutter/widgets.dart';

import '../color_palette.dart';

class EssentialPage extends StatelessWidget {
  const EssentialPage({super.key});

  // 위젯을 기준으로 보면, 하나의 메인 함수처럼 취급해볼 수 있음.
  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return SizedBox.fromSize(
      size: const Size(double.infinity, double.infinity),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: ColorPalette.background,
        ),
        child: SafeArea(
          child: Margin( // Flutter 에서는 Margin 이 없음.
            margin: const EdgeInsets.all(10.0),
            child: Container(
              // decoration 속성 사용 시 사용 불가
              // color: ColorPalette.background,
              decoration: BoxDecoration(
                color: ColorPalette.background,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: ColorPalette.main,
                ),
                // border: Border.fromBorderSide(
                // BorderSide(
                // width:
                //  ),
                // ),
              ),
              color: ColorPalette.background,
              child: const ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Text('Hello, World', style: Typography.mid),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
