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
    "Users"
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

  List<String> generatePageList(int pageSize) {
    List<String> pageList = [];
    for (int i = 0; i < pageSize; i++) {
      pageList.add(i.toString());
    }
    return pageList;
  }

  Future<void> fetchAllPosts() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      QuerySnapshot querySnapshot = await firestore.collection('posts').get();

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        String author = data['author'] ?? '';
        String desc = data['desc'] ?? '';
        String executeLink =
            data['excutelink'] ?? ''; // Note: typo in field name is preserved
        String image = data['image'] ?? '';
        int likes = data['likes'] ?? 0;
        String title = data['title'] ?? '';
        String kind = data['kind'] ?? '';

        debugPrint('Document ID: ${doc.id}');
        debugPrint('Author: $author');
        debugPrint('Description: $desc');
        debugPrint('Execute Link: $executeLink');
        debugPrint('Image: $image');
        debugPrint('Likes: $likes');
        debugPrint('Title: $title');
        debugPrint('Kind: $kind');
        debugPrint('-------------------');
      }
    } catch (e) {
      debugPrint('Error fetching documents: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
            onAbout: () async {
              fetchAllPosts();
            },
            onPost: () {},
            onLearn: () {},
            onUserName: () {}),
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
                    for (int i = 0; i < 10; i++)
                      ContentBox(
                        image: Image.asset("images/gameview-sample.png",
                            width: 281),
                        title: "Jump game with Pyxel resource file",
                        likes: 132,
                        comments: 12,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => ContentPage(
                                  title: "Jump game with Pyxel resource file",
                                  author: "sample",
                                  image:
                                      Image.asset("images/gameview-sample.png"),
                                  excuteLink:
                                      "https://github.com/kitao/pyxel/blob/main/docs/README.ja.md",
                                  likes: 2,
                                  comments: 3,
                                  desc: "desk")));
                        },
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
