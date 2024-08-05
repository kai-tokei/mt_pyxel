import 'package:flutter/material.dart';

class ContentBox extends StatelessWidget {
  const ContentBox({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.likes,
    required this.comments,
    required this.onPressed,
  });

  final String author;
  final Widget image;
  final String title;
  final int likes;
  final int comments;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: SizedBox(
            width: 280,
            height: 350,
            child: Column(
              children: [
                image,
                Text(title, style: const TextStyle(fontSize: 28)),
                Row(
                  children: [
                    Text("by $author",
                        style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.secondary))
                  ],
                ),
                Row(
                  children: [
                    Image.asset("images/heart.png", width: 28),
                    const SizedBox(width: 4),
                    Text(likes.toString(),
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 16),
                    Image.asset("images/comment.png", width: 28),
                    const SizedBox(width: 4),
                    Text(comments.toString(),
                        style: const TextStyle(fontSize: 20)),
                  ],
                )
              ],
            )));
  }
}
