import 'package:flutter/material.dart';
// components
import 'package:mt_pyxel/components/appbar_link_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.userName = "SignIn",
    required this.onAbout,
    required this.onPost,
    required this.onLearn,
    required this.onUserName,
  });

  final String userName;
  final VoidCallback onAbout;
  final VoidCallback onPost;
  final VoidCallback onLearn;
  final VoidCallback onUserName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SingleChildScrollView(
          child: Row(
        children: [
          TextButton(
              onPressed: onAbout,
              child: Text("Mt.Pyxel",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 32))),
          const SizedBox(width: 4),
          AppBarLinkButton(onPressed: onPost, label: "Post"),
          AppBarLinkButton(onPressed: onLearn, label: "Learn"),
          const Expanded(child: SizedBox()),
          TextButton(
              onPressed: onUserName,
              child: Text(userName,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 28))),
        ],
      )),
      backgroundColor: Theme.of(context).colorScheme.secondary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
