import 'package:flutter/material.dart';
// pages
import 'package:mt_pyxel/pages/home.dart';

void main() {
  runApp(const MtPyxel());
}

class MtPyxel extends StatelessWidget {
  const MtPyxel({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'k8x12',
        splashColor: const Color(0xffD4186B),
        colorScheme: const ColorScheme(
          primary: Color(0xffEEEEEE),
          onPrimary: Color(0xff395C98),
          secondary: Color(0xffA9C1FF),
          onSecondary: Color(0xff395C98),
          error: Colors.red,
          onError: Colors.red,
          surface: Color(0xff395C98),
          onSurface: Color(0xffEEEEEE),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
