import 'package:education/util/reflect.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {

  static final ROUTH = pageName<NotFound>();

  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(
        child: Text("없는 페이지 입니다."),
      ),
    );
  }
}
