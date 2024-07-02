import 'package:flutter/material.dart';

class CommonBottomBar extends StatelessWidget {
  const CommonBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 64),
      padding: const EdgeInsets.all(16),
      height: 180,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff2B335F),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text("Mt.Pyxel",
                  style: TextStyle(
                      fontSize: 38,
                      color: Theme.of(context).colorScheme.secondary))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text("(C) 2024 KaiTokei",
                  style: TextStyle(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.secondary))),
          Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text("GitHub",
                      style: TextStyle(
                          fontSize: 32,
                          color: Theme.of(context).colorScheme.secondary)))),
        ],
      ),
    );
  }
}
