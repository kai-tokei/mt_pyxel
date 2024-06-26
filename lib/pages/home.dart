import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarLinkButton extends StatelessWidget {
  const AppBarLinkButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(label,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary, fontSize: 28)));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text("Mt.Pyxel",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 32))),
              const SizedBox(width: 48),
              AppBarLinkButton(onPressed: () {}, label: "About"),
              const SizedBox(width: 16),
              AppBarLinkButton(onPressed: () {}, label: "Play"),
              const SizedBox(width: 16),
              AppBarLinkButton(onPressed: () {}, label: "Learn"),
              const SizedBox(width: 16),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: Center(
            child: Column(
          children: [
            Container(
                width: 512,
                height: 257,
                child: Image(
                  image: AssetImage("images/logo.png"),
                ))
          ],
        )));
  }
}
