import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  CategorySelector(
      {super.key, required this.categories, required this.categoryIndex});

  final List<String> categories;
  int categoryIndex;

  @override
  State<CategorySelector> createState() => CategorySelectorState();
}

class CategorySelectorState extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.categories.length; i++)
          Container(
              padding: const EdgeInsets.all(12),
              color: i == widget.categoryIndex
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.onPrimary,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    widget.categoryIndex = i;
                  });
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
                child: Text(
                  widget.categories[i],
                  style: TextStyle(
                      fontSize: 32,
                      color: i == widget.categoryIndex
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).primaryColor),
                ),
              )),
      ],
    );
  }
}
