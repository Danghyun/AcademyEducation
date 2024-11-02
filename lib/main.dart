import 'package:education/view/error/not_found.dart';
import 'package:education/view/home/home_page.dart';
import 'package:education/view/second/second_page.dart';
import 'package:flutter/material.dart';

void main() {
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

