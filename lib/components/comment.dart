import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.image,
    required this.username,
    required this.date,
    required this.comment,
  });

  final Widget image;
  final String username;
  final String date;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 830,
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Image.asset("images/gameview-sample.png", width: 138, height: 138),
            image,
            Text(username, style: const TextStyle(fontSize: 24)),
          ],
        ),
        const SizedBox(width: 8),
        SizedBox(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).colorScheme.secondary),
            ),
            SizedBox(
                width: 650,
                child: Text(comment, style: const TextStyle(fontSize: 18))),
          ],
        )),
        const SizedBox(width: 8),
      ]),
    );
  }
}
