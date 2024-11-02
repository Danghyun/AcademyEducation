import 'package:flutter/cupertino.dart';

mixin ArgumentsMixin<ARGUMENTS, W extends StatefulWidget> on State<W> {
  // 강제적 기본 값 구현 요구
  abstract ARGUMENTS arguments;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (!mounted) return;

      final ModalRoute? modalRoute = ModalRoute.of(context);
      final Object? arguments = modalRoute?.settings.arguments;

      if (arguments == null) return;
      if (arguments is! Map<String, Object>) return;

      this.arguments = arguments as ARGUMENTS;
    });
    super.initState();
  }

  void onArguments(ARGUMENTS arguments);
}
