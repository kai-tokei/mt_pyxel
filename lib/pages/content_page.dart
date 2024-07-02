import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        children: [
          const SizedBox(height: 64),
          Divider(
              thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
          Row(
            children: [
              const SizedBox(width: 84),
              Text("Simplest Application", style: TextStyle(fontSize: 48)),
              const Expanded(child: SizedBox()),
              Text("by Kitao",
                  style: TextStyle(
                      fontSize: 28,
                      color: Theme.of(context).colorScheme.secondary)),
              const SizedBox(width: 84),
            ],
          ),
          Divider(
              thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(height: 64),
          Image.asset(
            "images/gameview-sample.png",
            width: 720,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 84,
            width: 700,
            child: Row(
              children: [
                Image.asset("images/heart.png", width: 38),
                const SizedBox(width: 4),
                Text("136", style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 24),
                Image.asset("images/comment.png", width: 38),
                const SizedBox(width: 4),
                Text("13", style: const TextStyle(fontSize: 28)),
              ],
            ),
          ),
          SizedBox(
              width: 680,
              child: Text(
                """
Welcome to "Hello, Pyxel!" - a simple yet charming introduction to the world of Pyxel. This project features an introductory screen that greets you with the text "Hello, Pyxel!" along with a Pyxel logo, showcasing the retro 8-bit aesthetic that Pyxel is known for. This project is perfect for beginners who want to get a feel for creating graphics and simple animations using Pyxel. Dive into the nostalgic world of pixel art and start your journey with Pyxel today!
""",
                style: TextStyle(fontSize: 24),
              )),
          const SizedBox(height: 16),
          SizedBox(
            width: 1000,
            child: Column(
              children: [
                Divider(
                    thickness: 2.5,
                    color: Theme.of(context).colorScheme.secondary),
                const Row(
                  children: [
                    SizedBox(width: 112),
                    Text("Comments", style: TextStyle(fontSize: 48))
                  ],
                ),
                Divider(
                    thickness: 2.5,
                    color: Theme.of(context).colorScheme.secondary)
              ],
            ),
          ),
          const SizedBox(height: 64),
          SizedBox(
              width: 830,
              child: Column(
                children: [
                  TextField(
                      style: const TextStyle(fontSize: 22),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      maxLength: 500,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              borderRadius: BorderRadius.circular(0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              borderRadius: BorderRadius.circular(0)))),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      onPressed: () {},
                      child:
                          const Text("Comment", style: TextStyle(fontSize: 32)),
                    ),
                    const SizedBox(width: 32)
                  ])
                ],
              )),
          const CommonBottomBar()
        ],
      ))),
    );
  }
}
