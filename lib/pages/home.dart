import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// components
import 'package:mt_pyxel/components/common_appbar.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';
import 'package:mt_pyxel/components/category_selector.dart';
import 'package:mt_pyxel/components/common_searchbox.dart';

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

  List<String> generatePageList(int pageSize) {
    List<String> pageList = [];
    for (int i = 0; i < pageSize; i++) {
      pageList.add(i.toString());
    }
    return pageList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          onAbout: () {},
          onPlay: () {},
          onLearn: () {},
          onUserName: () {},
        ),
        body: SingleChildScrollView(
            child: Center(
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
                categories: categories, categoryIndex: categoryIndex),
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
            CategorySelector(
                categorySize: 0,
                fontSize: 24,
                categories: generatePageList(pageSize),
                categoryIndex: pageIndex),
            const SizedBox(height: 64),
            const SizedBox(height: 64),
            CategorySelector(
                categorySize: 0,
                fontSize: 24,
                categories: generatePageList(pageSize),
                categoryIndex: pageIndex),
            const CommonBottomBar()
          ],
        ))));
  }
}
