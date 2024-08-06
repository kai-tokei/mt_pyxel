import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:html' as html;
// components
import 'package:mt_pyxel/components/category_selector.dart';
import 'package:mt_pyxel/components/common_appbar.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';
import 'package:mt_pyxel/components/common_searchbox.dart';
import 'package:mt_pyxel/components/content.dart';
import 'package:mt_pyxel/pages/content_page.dart';
import 'package:mt_pyxel/pages/login_page.dart';
import 'package:mt_pyxel/pages/post.dart';
// structs
import 'package:mt_pyxel/structs/content.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<String> categories = [
    "All",
    "Games",
    "Tech",
    "Tools",
    "Paints",
    "Musics",
    "Others"
  ];

  List<String> sortCategories = [
    "Popular",
    "Most Recent",
  ];

  int categoryIndex = 0;
  int sortCategoryIndex = 0;
  int pageIndex = 0;
  int pageSize = 5;
  int contentSize = 6;

  final auth = FirebaseAuth.instance;

  List<Content> contents = [];

  List<String> generatePageList(int pageSize) {
    List<String> pageList = [];
    for (int i = 0; i < pageSize; i++) {
      pageList.add(i.toString());
    }
    return pageList;
  }

  bool categoryFilter(Content content) {
    return categories[categoryIndex] == 'All' ||
        content.kind == categories[categoryIndex];
  }

  Stream<List<Content>> fetchAllPosts() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return firestore.collection('posts').snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        Content content = Content(
          title: data['title'] ?? '',
          author: data['author'] ?? '',
          executeLink: data['executeLink'] ?? '',
          image: data['image'],
          likes: data['likes'] ?? 0,
          comments: data['comments'] ?? 0,
          desc: data['desc'] ?? '',
          kind: data['kind'] ?? '',
        );
        return content;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          userName: auth.currentUser?.email ?? "SignIn",
          onAbout: () => setState(() {}),
          onPost: () {
            auth.authStateChanges().listen((User? user) {
              if (user == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("User is currently signed out!",
                        style: TextStyle(fontSize: 32))));
              } else {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => const PostPage()));
              }
            });
          },
          onLearn: () =>
              html.window.open('https://github.com/kitao/pyxel', 'new tab'),
          onUserName: () => Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (builder) => LogInPage(auth: auth)))
              .then((_) => setState(() {})),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
          children: [
            const SizedBox(height: 64),
            Container(
                margin: const EdgeInsets.all(8),
                width: 512,
                height: 257,
                child: const Image(image: AssetImage("images/logo.png"))),
            const SizedBox(height: 64),
            CategorySelector(
                onPressed: (v) => setState(() {
                      categoryIndex = v;
                    }),
                categories: categories,
                categoryIndex: categoryIndex),
            const SizedBox(height: 16),
            SizedBox(
                width: 1000,
                child: Divider(
                    thickness: 3,
                    color: Theme.of(context).colorScheme.secondary)),

            const SizedBox(height: 16),
            SizedBox(
                width: 950,
                child: Row(children: [
                  CategorySelector(
                    onPressed: (v) => setState(() {
                      sortCategoryIndex = v;
                    }),
                    mainAxisAlignment: MainAxisAlignment.start,
                    categories: sortCategories,
                    categoryIndex: sortCategoryIndex,
                    fontSize: 24,
                    categorySize: 4,
                  ),
                  const Expanded(child: SizedBox()),
                  CommonSearchBox(onChanged: (v) {})
                ])),
            const SizedBox(height: 64),

            // ここからコンテンツ
            SizedBox(
                width: 950,
                child: Wrap(runSpacing: 16, spacing: 45, children: [
                  StreamBuilder<List<Content>>(
                      stream: fetchAllPosts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Text('No data available');
                        } else {
                          contents = snapshot.data!;
                          return SizedBox(
                              width: 950,
                              child: Wrap(
                                runSpacing: 16,
                                spacing: 45,
                                children: contents.map((content) {
                                  return ContentBox(
                                      image: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Image.network(content.image,
                                              height: 180, width: 200)),
                                      title: content.title,
                                      likes: content.likes,
                                      author: content.author,
                                      comments: content.comments,
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => ContentPage(
                                            title: content.title,
                                            author: content.author,
                                            image: Image.network(content.image,
                                                width: 650),
                                            executeLink: content.executeLink,
                                            likes: content.likes,
                                            comments: content.comments,
                                            desc: content.desc,
                                          ),
                                        ));
                                      });
                                }).toList(),
                              ));
                        }
                      })
                ])),
            // ここまでコンテンツ

            const SizedBox(height: 64),
            CategorySelector(
                onPressed: (v) => setState(() {
                      categoryIndex = v;
                    }),
                categories: categories,
                categoryIndex: categoryIndex),
            const SizedBox(height: 64),
            const CommonBottomBar()
          ],
        ))));
  }
}
