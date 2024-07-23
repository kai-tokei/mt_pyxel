import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
// components
import 'package:mt_pyxel/components/appbar_link_button.dart';

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
    String _displayName = "";
    final googleLogin = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);

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
              onPressed: () async {
                final googleLogin = GoogleSignIn(scopes: [
                  'email',
                  'https://www.googleapis.com/auth/contacts.readonly'
                ]);
                GoogleSignInAccount? signInAccount = await googleLogin.signIn();
                if (signInAccount == null) return;
                GoogleSignInAuthentication auth =
                    await signInAccount.authentication;
                final OAuthCredential credential =
                    GoogleAuthProvider.credential(
                        idToken: auth.idToken, accessToken: auth.accessToken);
                User? user = (await FirebaseAuth.instance
                        .signInWithCredential(credential))
                    .user;
                if (user != null) {
                  _displayName = user.displayName!;
                  debugPrint(_displayName);
                }
              },
              //child: Text(userName,
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
