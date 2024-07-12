import 'package:flutter/material.dart';
// pages
import 'package:mt_pyxel/pages/home.dart';
import 'package:mt_pyxel/pages/content_page.dart';
import 'package:mt_pyxel/pages/post.dart';
import 'package:mt_pyxel/pages/user_profile.dart';
import 'package:mt_pyxel/pages/user_settings.dart';
import 'package:mt_pyxel/components/common_appbar.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';

void main() {
  runApp(const MtPyxel());
}

class MtPyxel extends StatelessWidget {
  const MtPyxel({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mt.Pyxel',
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
      home: Scaffold(
          appBar: CommonAppBar(
            onAbout: () {},
            onPlay: () {},
            onLearn: () {},
            onUserName: () {},
          ),
          body: SingleChildScrollView(
              child: Center(
                  child: Column(
            children: [
              //ContentPage(
              //  title: "Simple Application",
              //  author: "by Kitao",
              //  image: Image.asset(
              //    "images/gameview-sample.png",
              //    width: 650,
              //    fit: BoxFit.contain,
              //  ),
              //  likes: 123,
              //  comments: 3,
              //  desc: "This is the simplest Project",
              //),
              //Home(),
              //PostPage(),
              //UserSettingsPage(),
              UserProfilePage(),
              const CommonBottomBar(),
            ],
          )))),
    );
  }
}
