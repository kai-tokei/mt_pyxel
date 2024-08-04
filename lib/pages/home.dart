import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:go_router/go_router.dart';
// components
import 'package:mt_pyxel/components/category_selector.dart';
import 'package:mt_pyxel/components/common_appbar.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';
import 'package:mt_pyxel/components/common_searchbox.dart';
import 'package:mt_pyxel/components/content.dart';
import 'package:mt_pyxel/pages/content_page.dart';
// structs
import 'package:mt_pyxel/structs/content.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<String> categories = [
    "Games",
    "Tech",
    "Tools",
    "Paints",
    "Musics",
    "others"
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

  List<Content> contents = [];

  List<String> generatePageList(int pageSize) {
    List<String> pageList = [];
    for (int i = 0; i < pageSize; i++) {
      pageList.add(i.toString());
    }
    return pageList;
  }

  Stream<List<Content>> fetchAllPosts() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return firestore.collection('posts').snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();

        Content content = Content(
          title: data['title'] ?? '',
          author: data['author'] ?? '',
          executeLink: data['executeLink'],
          image: Image.network(
            data['image'],
            width: 238,
          ),
          likes: data['likes'] ?? 0,
          comments: data['comments'] ?? 0,
          desc: data['desc'] ?? '',
          kind: data['kind'] ?? '',
        );
        return content;
      }).toList();
    });
  }

  //Future<List<Content>> fetchAllPosts() async {
  //  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //  List<Content> contents = [];

  //  try {
  //    QuerySnapshot querySnapshot = await firestore.collection('posts').get();

  //    for (var doc in querySnapshot.docs) {
  //      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

  //      Content content = Content(
  //          title: data['title'] ?? '',
  //          author: data['author'] ?? '',
  //          image: Image.network(
  //            data['image'],
  //            width: 238,
  //          ),
  //          likes: data['likes'] ?? 0,
  //          comments: data['comments'] ?? 0,
  //          desc: data['desc'] ?? '',
  //          kind: data['kind'] ?? '');
  //      String author = data['author'] ?? '';
  //      String desc = data['desc'] ?? '';
  //      String executeLink =
  //          data['excutelink'] ?? ''; // Note: typo in field name is preserved
  //      dynamic image = data['image'] ?? '';
  //      int likes = data['likes'] ?? 0;
  //      String title = data['title'] ?? '';
  //      String kind = data['kind'] ?? '';

  //      debugPrint('Document ID: ${doc.id}');
  //      debugPrint('Author: $author');
  //      debugPrint('Description: $desc');
  //      debugPrint('Execute Link: $executeLink');
  //      debugPrint('Image: $image');
  //      debugPrint('Likes: $likes');
  //      debugPrint('Title: $title');
  //      debugPrint('Kind: $kind');
  //      debugPrint('-------------------');

  //      contents.add(content);
  //    }
  //    return Future<List<Content>>.value(contents);
  //  } catch (e) {
  //    debugPrint('Error fetching documents: $e');
  //    Content content = const Content(
  //        title: 'title',
  //        author: 'author',
  //        image: Image(image: AssetImage("images/logo.png")),
  //        likes: 0,
  //        comments: 0,
  //        desc: 'desc.',
  //        kind: 'others');
  //    contents.add(content);
  //  }
  //  return Future<List<Content>>.value(contents);
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
            onAbout: () {}, onPost: () {}, onLearn: () {}, onUserName: () {}),
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
                child: Wrap(
                  runSpacing: 16,
                  spacing: 45,
                  children: [
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
                                  image: content.image,
                                  title: content.title,
                                  likes: content.likes,
                                  comments: content.comments,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => ContentPage(
                                        title: content.title,
                                        author: content.author,
                                        image: content.image,
                                        excuteLink: "https://example.com",
                                        likes: content.likes,
                                        comments: content.comments,
                                        desc: content.desc,
                                      ),
                                    ));
                                  },
                                );
                              }).toList(),
                            ),
                          );
                        }
                      },
                      //for (int i = 0; i < contents.length; i++)
                      //  ContentBox(
                      //    image: Image.asset("images/gameview-sample.png",
                      //        width: 281),
                      //    title: "Jump game with Pyxel resource file",
                      //    likes: 132,
                      //    comments: 12,
                      //    onPressed: () {
                      //      Navigator.of(context).push(MaterialPageRoute(
                      //          builder: (builder) => ContentPage(
                      //              title: "Jump game with Pyxel resource file",
                      //              author: "sample",
                      //              image:
                      //                  Image.asset("images/gameview-sample.png"),
                      //              excuteLink:
                      //                  "https://github.com/kitao/pyxel/blob/main/docs/README.ja.md",
                      //              likes: 2,
                      //              comments: 3,
                      //              desc: "desk")));
                      //    },
                      //  )
                    )
                  ],
                )),
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
