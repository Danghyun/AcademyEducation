import 'package:education/util/uni_platform/uni_platform.dart';
import 'package:education/view/error/not_found.dart';
import 'package:education/view/home/home_page.dart';
import 'package:education/view/second/second_page.dart';
import 'package:flutter/material.dart';

//테스트

void main() {
  // 플랫폼을 구분하여 호출하는 코드
  UniPlatform uniPlatform = createUniPlatform();
  bool isNative = uniPlatform.isNative();
  bool isWeb = uniPlatform.isWeb();
  if(isNative && uniPlatform.isAndroid) {

  } else if(isNative && uniPlatform.isIOS) {

  } else if(isNative && uniPlatform.isWindows) {

  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      initialRoute: HomePage.ROUTH,
      routes: <String, WidgetBuilder>{
        HomePage.ROUTH : (BuildContext context) =>
          const HomePage(title: 'Flutter Demo Home Page'),
        SecondPage.ROUTH : (BuildContext context) =>
          const SecondPage(),
        NotFound.ROUTH : (BuildContext context) =>
        const NotFound(),
      },
    );
  }
}

