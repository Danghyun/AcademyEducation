import 'package:education/util/agrumentsmixin.dart';
import 'package:education/view/home/home_page.dart';
import 'package:flutter/material.dart';
import '../../util/reflect.dart';

class SecondPage extends StatefulWidget {
  // /SecondPage
  static final ROUTH = pageName<SecondPage>();

  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
  with ArgumentsMixin<Object?, SecondPage> {

  // 자동 액세서 구현
  @override
  Object? arguments;

  // 직접 빽킹 필드 및 액세서 구현
  // @override
  // Object? get arguments => _arguments;
  // @override
  // set arguments(newValue) => _arguments = newValue;
  // Object? _arguments;

  @override
  void onArguments(Object? arguments) {
    // 아규먼트가 수집되었을 때 처리할 사항들
  }


  @override
  Widget build(BuildContext context) {
    final arguments = this.arguments != null ? "아규먼트 있음" : "아규먼트 없음";
    return GestureDetector(
      onTap: _back,
      child: Container(
        child: GestureDetector(
          onTap: () {
            _notFound();
          },
          child: Text("두번째 페이지"),
        ),
      ),
    );
  }

  void _back() {
    // setState(() {
    //   _counter++;
    if (!mounted) {
      return;
    }

    final navigator = Navigator.of(context);
    navigator.pop(HomePage.ROUTH);
  }

  void _notFound() {
    // setState(() {
    //   _counter++;
    if (!mounted) {
      return;
    }

    final navigator = Navigator.of(context);
    navigator.pushNamed('NOT FOUND');
  }
}
