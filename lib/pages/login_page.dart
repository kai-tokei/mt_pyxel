// packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';
// components
import 'package:mt_pyxel/components/page_title.dart';
import 'package:mt_pyxel/components/singleline_textfield.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  // 入力系
  String mailAddress = "";
  String password = "";

  // auth系
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 64),
        const PageTitle(title: "SignIn / SignUp"),
        const SizedBox(height: 84),

        // Mail Address
        const Text("Mail Address", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SinglelineTextField(
            onChanged: (v) => setState(() {
                  mailAddress = v;
                })),
        const SizedBox(height: 48),

        // Password
        const Text("Password", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SinglelineTextField(
            onChanged: (v) => setState(() {
                  password = v;
                })),
        const SizedBox(height: 48),

        // Sign Up
        const SizedBox(height: 64),
        ElevatedButton(
            onPressed: () async {
              try {
                await _auth.signInWithEmailAndPassword(
                    email: mailAddress, password: password);
                debugPrint("Sign In");
              } catch (e) {
                debugPrint(e.toString());
                try {
                  await _auth.createUserWithEmailAndPassword(
                      email: mailAddress, password: password);
                  debugPrint("Sign Up");
                } catch (e) {
                  debugPrint(e.toString());
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
            ),
            child: Text("  Sign Up/In  ",
                style: TextStyle(
                    fontSize: 48,
                    color: Theme.of(context).colorScheme.onPrimary))),
        const SizedBox(height: 32),
        const CommonBottomBar()
      ],
    ));
  }
}
