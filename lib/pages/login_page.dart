// packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';
// components
import 'package:mt_pyxel/components/page_title.dart';
import 'package:mt_pyxel/components/singleline_textfield.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key, required this.auth});

  final FirebaseAuth auth;

  @override
  State<LogInPage> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  // 入力系
  String mailAddress = "";
  String password = "";

  Future createUserWithEmailAndPassword(
      String email, String password, String name) async {
    await widget.auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
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
            obsecureText: true,
            onChanged: (v) => setState(() {
                  password = v;
                })),

        const SizedBox(height: 128),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sign Up
            ElevatedButton(
                onPressed: () async {
                  try {
                    await widget.auth.createUserWithEmailAndPassword(
                        email: mailAddress, password: password);
                    debugPrint("Sign Up");
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Sign Up successful!",
                          style: TextStyle(fontSize: 32)),
                      duration: Duration(seconds: 10),
                    ));
                    Navigator.of(context).pop();
                  } catch (e) {
                    debugPrint(e.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to certify: $e')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
                child: Text("  Sign Up  ",
                    style: TextStyle(
                        fontSize: 48,
                        color: Theme.of(context).colorScheme.onPrimary))),

            const SizedBox(width: 32),

            // Sign In
            ElevatedButton(
                onPressed: () async {
                  try {
                    await widget.auth.signInWithEmailAndPassword(
                        email: mailAddress, password: password);
                    debugPrint("Sign In");
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Sign In successful!",
                            style: TextStyle(fontSize: 32))));
                    Navigator.of(context).pop();
                  } catch (e) {
                    debugPrint(e.toString());
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Failed to certify: $e",
                            style: TextStyle(fontSize: 32))));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
                child: Text("  Sign In  ",
                    style: TextStyle(
                        fontSize: 48,
                        color: Theme.of(context).colorScheme.onPrimary))),
          ],
        ),
        const SizedBox(height: 84),
        const CommonBottomBar()
      ],
    )));
  }
}
