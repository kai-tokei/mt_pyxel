import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// components
import 'package:mt_pyxel/components/common_appbar.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < categories.length; i++)
                  Container(
                      padding: const EdgeInsets.all(12),
                      color: i == categoryIndex
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.onPrimary,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            categoryIndex = i;
                          });
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                        ),
                        child: Text(
                          categories[i],
                          style: TextStyle(
                              fontSize: 32,
                              color: i == categoryIndex
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).primaryColor),
                        ),
                      )),
              ],
            ),
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
