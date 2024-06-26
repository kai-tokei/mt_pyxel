import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// components
import 'package:mt_pyxel/components/common_appbar.dart';
import 'package:mt_pyxel/components/category_selector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<String> categories = [
    "Games",
    "Tech",
    "Tools",
    "Paints",
    "Musics",
    "Users"
  ];
  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 64),
            Container(
                margin: const EdgeInsets.all(8),
                width: 512,
                height: 257,
                child: const Image(image: AssetImage("images/logo.png"))),
            const SizedBox(height: 64),
            CategorySelector(
                categories: categories, categoryIndex: categoryIndex),
            const SizedBox(height: 16),
            SizedBox(
                width: 728,
                child: Divider(
                    thickness: 3,
                    color: Theme.of(context).colorScheme.secondary)),
          ],
        ))));
  }
}
