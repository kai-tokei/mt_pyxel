import 'package:flutter/material.dart';
import 'package:mt_pyxel/components/page_title.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  // 入力系
  String mailAddress = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 64),
        const PageTitle(title: "LogIn"),
        const SizedBox(height: 84),

        // Mail Address
        const Text("Mail Address", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SizedBox(
            width: 500,
            child: TextField(
                onChanged: (v) => setState(() {
                      mailAddress = v;
                    }),
                style: const TextStyle(fontSize: 20),
                maxLength: 84,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.5,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(0))))),
        const SizedBox(height: 48),

        // Password
        const Text("Password", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SizedBox(
            width: 500,
            child: TextField(
                onChanged: (v) => setState(() {
                      password = v;
                    }),
                obscureText: true,
                style: const TextStyle(fontSize: 20),
                maxLength: 84,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.5,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(0))))),
        const SizedBox(height: 48),

        // Confirm Button
        const SizedBox(height: 64),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
            ),
            child: Text("  Confirm  ",
                style: TextStyle(
                    fontSize: 48,
                    color: Theme.of(context).colorScheme.onPrimary))),
        const SizedBox(height: 32),
      ],
    );
  }
}
