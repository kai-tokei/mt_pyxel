import 'package:flutter/material.dart';
// components
import 'package:mt_pyxel/components/comment.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({
    super.key,
    required this.title,
    required this.author,
    required this.image,
    required this.likes,
    required this.comments,
    required this.desc,
  });

  final String title;
  final String author;
  final Widget image;
  final int likes;
  final int comments;
  final String desc;

  @override
  State<ContentPage> createState() => ContentPageState();
}

class ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 64),
      Divider(thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
      Row(
        children: [
          const SizedBox(width: 84),
          Text(widget.title, style: const TextStyle(fontSize: 48)),
          const Expanded(child: SizedBox()),
          Text(widget.author,
              style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(width: 84),
        ],
      ),
      Divider(thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
      const SizedBox(height: 64),
      widget.image,
      //Image.asset(
      //  "images/gameview-sample.png",
      //  width: 650,
      //  fit: BoxFit.contain,
      //),
      SizedBox(
        height: 84,
        width: 600,
        child: Row(
          children: [
            Image.asset("images/heart.png", width: 38),
            const SizedBox(width: 4),
            Text(widget.likes.toString(), style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 24),
            Image.asset("images/comment.png", width: 38),
            const SizedBox(width: 4),
            Text(widget.comments.toString(),
                style: const TextStyle(fontSize: 28)),
          ],
        ),
      ),
      SizedBox(
          width: 680,
          child: Text(widget.desc, style: const TextStyle(fontSize: 24))),
      const SizedBox(height: 32),
      SizedBox(
        width: 1000,
        child: Column(
          children: [
            Divider(
                thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
            const Row(
              children: [
                SizedBox(width: 112),
                Text("Comments", style: TextStyle(fontSize: 48))
              ],
            ),
            Divider(
                thickness: 2.5, color: Theme.of(context).colorScheme.secondary)
          ],
        ),
      ),
      const SizedBox(height: 64),
      SizedBox(
          width: 630,
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
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(0)))),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  child: Text("Comment",
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.onPrimary)),
                )
              ]),
            ],
          )),
      const SizedBox(height: 32),
      Comment(
          image: Image.asset("images/gameview-sample.png",
              width: 138, height: 138),
          username: 'user1',
          date: '2024/8/15',
          comment: "This is the first comment."),
    ]);
  }
}
