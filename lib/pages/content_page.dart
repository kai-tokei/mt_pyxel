import 'package:flutter/material.dart';
// components
import 'package:mt_pyxel/components/common_appbar.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => ContentPageState();
}

class ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onAbout: () {},
        onPlay: () {},
        onLearn: () {},
        onUserName: () {},
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        children: [],
      ))),
      bottomNavigationBar: const CommonBottomBar(),
    );
  }
}
