import 'package:flutter/material.dart';
// components
import 'package:mt_pyxel/components/page_title.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => UserSettingsPageState();
}

class UserSettingsPageState extends State<UserSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 64),
        const PageTitle(title: "Profile Settings"),
        const SizedBox(height: 84),

        // Icon
        const Text("Icon", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        InkWell(
            splashColor: Colors.transparent,
            onTap: () {},
            child: Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.secondary, width: 2.5),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Image.asset("images/upload.png", height: 32),
            )),
        const SizedBox(height: 48),

        // Project Name
        const Text("User Name", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SizedBox(
            width: 400,
            child: TextField(
                style: const TextStyle(fontSize: 20),
                maxLength: 64,
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

        // Description
        const Text("Introduction", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SizedBox(
            width: 600,
            child: TextField(
                style: const TextStyle(fontSize: 22),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                maxLength: 3000,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(0))))),
        const SizedBox(height: 32),

        const SizedBox(height: 32),
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
