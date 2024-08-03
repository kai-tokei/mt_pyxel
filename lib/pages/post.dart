import 'package:flutter/material.dart';
// components
import 'package:mt_pyxel/components/page_title.dart';
import 'package:mt_pyxel/components/category_selector.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  List<String> categories = [
    "Games",
    "Tech",
    "Tools",
    "Paints",
    "Musics",
    "Users"
  ];

  int categoryIndex = 0;

  // Data
  String projectName = "";
  String executionLink = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 64),
        const PageTitle(title: "Post Your Project"),
        const SizedBox(height: 84),

        // Thumbnail
        const Text("Thumbnail", style: TextStyle(fontSize: 36)),
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
        const SizedBox(height: 32),

        // Project Name
        const Text("Project Name", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SizedBox(
            width: 400,
            child: TextField(
                onChanged: (v) => setState(() {
                      projectName = v;
                    }),
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
        const SizedBox(height: 32),

        // Execution Link
        const Text("Execution Link", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SizedBox(
            width: 400,
            child: TextField(
                style: const TextStyle(fontSize: 20),
                maxLength: 512,
                onChanged: (v) => setState(() {
                      executionLink = v;
                    }),
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
        const SizedBox(height: 32),

        // Description
        const Text("Description", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SizedBox(
            width: 600,
            child: TextField(
                style: const TextStyle(fontSize: 22),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                maxLength: 3000,
                onChanged: (v) => setState(() {
                      description = v;
                    }),
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

        // Category
        const Text("Category", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        CategorySelector(
            onPressed: (v) => setState(() {
                  categoryIndex = v;
                }),
            categories: categories,
            categoryIndex: categoryIndex),
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
            child: Text("  POST  ",
                style: TextStyle(
                    fontSize: 48,
                    color: Theme.of(context).colorScheme.onPrimary))),
        const SizedBox(height: 32),
      ],
    );
  }
}
