import 'package:flutter/material.dart';
// components
import 'package:mt_pyxel/components/page_title.dart';
import 'package:mt_pyxel/components/category_selector.dart';
import 'package:mt_pyxel/components/common_searchbox.dart';
import 'package:mt_pyxel/components/content.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage> {
  String userName = "Pixel Master";
  Widget userIcon = Image.asset("images/gameview-sample.png");
  String introduction = """
Hello, I'm PixelMaster! I'm a retro game enthusiast and an avid Pyxel developer. My passion for 8-bit graphics and nostalgic gameplay drives me to create unique and engaging projects. I love exploring the possibilities of Pyxel and sharing my creations with the community. When I'm not coding, you can find me playing classic arcade games or drawing pixel art. Let's connect and bring the magic of retro gaming to life!
""";

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        PageTitle(title: userName),
        SizedBox(width: 400, height: 400, child: userIcon),
        const SizedBox(height: 16),
        SizedBox(
          width: 700,
          child: Text(
            introduction,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(height: 24),
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
                thickness: 3, color: Theme.of(context).colorScheme.secondary)),
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
        CategorySelector(
            onPressed: (v) => setState(() {
                  pageIndex = v;
                }),
            categorySize: 0,
            fontSize: 24,
            categories: generatePageList(pageSize),
            categoryIndex: pageIndex),
        const SizedBox(height: 64),
        // ここまでコンテンツ

        SizedBox(
            width: 950,
            child: Wrap(
              runSpacing: 16,
              spacing: 45,
              children: [
                for (int i = 0; i < 10; i++)
                  ContentBox(
                    image:
                        Image.asset("images/gameview-sample.png", width: 281),
                    title: "Jump game with Pyxel resource file",
                    likes: 132,
                    comments: 12,
                    onPressed: () {},
                  )
              ],
            )),
        const SizedBox(height: 64),
        CategorySelector(
            onPressed: (v) => setState(() {
                  pageIndex = v;
                }),
            categorySize: 0,
            fontSize: 24,
            categories: generatePageList(pageSize),
            categoryIndex: pageIndex),
        const SizedBox(height: 48),
        CategorySelector(
            onPressed: (v) => setState(() {
                  categoryIndex = v;
                }),
            categories: categories,
            categoryIndex: categoryIndex),
        const SizedBox(height: 24),
      ],
    );
  }
}
