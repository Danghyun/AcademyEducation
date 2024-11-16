part of '../my.widgets.dart';

/// Flutter 에서는 Margin 이 지원되지 않습니다.
/// 그래서, 본 위젯은 하위 위젯에 대해 바깥 여백(Margin)을 붙여줍니다.
class Margin extends StatelessWidget {
  /// - @param [margin] 바깥 여백 크기
  /// - @param [child] 하위 위젯
  const Margin({
    super.key,
    required this.margin,
    required this.child,
  });

  /// 바깥 여백 크기
  final EdgeInsetsGeometry margin;
  /// 하위 위젯 크기
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: child,
    );
  }
}
