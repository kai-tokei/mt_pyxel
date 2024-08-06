import 'package:flutter/material.dart';
import 'package:mt_pyxel/structs/content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:html' as html;
// components
// import 'package:mt_pyxel/components/comment.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key, required this.content});

  final Content content;

  @override
  State<ContentPage> createState() => ContentPageState();
}

class ContentPageState extends State<ContentPage> {
  bool liked = false;

  Future<void> incLikes() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final ref = db.collection('posts').doc(widget.content.id);
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please Sign In!!', style: TextStyle(fontSize: 32))));
      return;
    }

    final userId = user.uid;

    return db.runTransaction((transaction) async {
      final snapshot = await transaction.get(ref);

      if (!snapshot.exists) {
        throw Exception("Document does not exist!");
      }

      List<dynamic> likers = snapshot.data()?['likers'] ?? [];
      int likes = snapshot.data()?['likes'] ?? 0;

      if (!likers.contains(userId)) {
        likers.add(userId);
        likes += 1;
        transaction.update(ref, {
          'likes': likes,
          'likers': likers,
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Like!!', style: TextStyle(fontSize: 32))));
        setState(() {
          widget.content.likes = likes;
          liked = true;
        });
      } else {
        likers.remove(userId);
        likes -= 1;
        transaction.update(ref, {
          'likes': likes,
          'likers': likers,
        });
        setState(() {
          widget.content.likes = likes;
          liked = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Cancel!!', style: TextStyle(fontSize: 32))));
      }
    });
  }

  Future<void> _getLikes() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final ref = db.collection('posts').doc(widget.content.id);
    final snapshot = await ref.get();

    if (snapshot.exists) {
      setState(() {
        widget.content.likes = snapshot.data()?['likes'] ?? 0;
        List<dynamic> likers = snapshot.data()?['likers'] ?? [];
        liked = likers.contains(FirebaseAuth.instance.currentUser?.uid);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getLikes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
      const SizedBox(height: 64),
      Divider(thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
      Row(
        children: [
          const SizedBox(width: 84),
          Text(widget.content.title, style: const TextStyle(fontSize: 48)),
          const Expanded(child: SizedBox()),
          Text(widget.content.author,
              style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(width: 32),
          IconButton(
              onPressed: () {},
              icon: Image.asset('images/trashbox.png', width: 32)),
          const SizedBox(width: 84),
        ],
      ),
      Divider(thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
      const SizedBox(height: 64),
      InkWell(
        child: Image.network(widget.content.image, width: 650),
        onTap: () => html.window.open(widget.content.executeLink, 'new tab'),
      ),
      SizedBox(
        height: 84,
        width: 700,
        child: Row(
          children: [
            IconButton(
                icon: Image.asset("images/heart.png", width: 38),
                onPressed: incLikes),
            const SizedBox(width: 4),
            Text(widget.content.likes.toString(),
                style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 24),
            Image.asset("images/comment.png", width: 38),
            const SizedBox(width: 4),
            Text(widget.content.comments.toString(),
                style: const TextStyle(fontSize: 28)),
          ],
        ),
      ),
      SizedBox(
          width: 680,
          child:
              Text(widget.content.desc, style: const TextStyle(fontSize: 24))),
      const SizedBox(height: 64),
      const CommonBottomBar()
      //SizedBox(
      //  width: 1000,
      //  child: Column(
      //    children: [
      //      Divider(
      //          thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
      //      const Row(
      //        children: [
      //          SizedBox(width: 112),
      //          Text("Comments", style: TextStyle(fontSize: 48))
      //        ],
      //      ),
      //      Divider(
      //          thickness: 2.5, color: Theme.of(context).colorScheme.secondary)
      //    ],
      //  ),
      //),
      //const SizedBox(height: 64),
      //SizedBox(
      //    width: 630,
      //    child: Column(
      //      children: [
      //        TextField(
      //            style: const TextStyle(fontSize: 22),
      //            keyboardType: TextInputType.multiline,
      //            maxLines: 5,
      //            maxLength: 500,
      //            decoration: InputDecoration(
      //                focusedBorder: OutlineInputBorder(
      //                    borderSide: BorderSide(
      //                        width: 3,
      //                        color: Theme.of(context).colorScheme.secondary),
      //                    borderRadius: BorderRadius.circular(0)),
      //                enabledBorder: OutlineInputBorder(
      //                    borderSide: BorderSide(
      //                        width: 3,
      //                        color: Theme.of(context).colorScheme.secondary),
      //                    borderRadius: BorderRadius.circular(0)))),
      //        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      //          TextButton(
      //            onPressed: () {},
      //            style: TextButton.styleFrom(backgroundColor: Colors.white),
      //            child: Text("Comment",
      //                style: TextStyle(
      //                    fontSize: 24,
      //                    color: Theme.of(context).colorScheme.onPrimary)),
      //          )
      //        ]),
      //      ],
      //    )),
      //const SizedBox(height: 32),
      //Comment(
      //    image: Image.asset("images/gameview-sample.png",
      //        width: 138, height: 138),
      //    username: 'user1',
      //    date: '2024/8/15',
      //    comment: "This is the first comment."),
    ]))));
  }
}
