import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategorySelector extends StatefulWidget {
  CategorySelector({
    super.key,
    required this.categories,
    required this.categoryIndex,
    required this.onPressed,
    this.categorySize = 8,
    this.fontSize = 32,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  final List<String> categories;
  final MainAxisAlignment mainAxisAlignment;
  final Function(int)? onPressed;
  final double categorySize;
  final double fontSize;
  int categoryIndex;

  @override
  State<CategorySelector> createState() => CategorySelectorState();
}

class CategorySelectorState extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: [
            for (int i = 0; i < widget.categories.length; i++)
              Row(children: [
                const SizedBox(width: 8),
                Container(
                    padding: EdgeInsets.all(widget.categorySize),
                    color: i == widget.categoryIndex
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.onPrimary,
                    child: TextButton(
                      onPressed: () => setState(() {
                        widget.categoryIndex = i;
                        widget.onPressed!(i);
                      }),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                      ),
                      child: Text(
                        widget.categories[i],
                        style: TextStyle(
                            fontSize: widget.fontSize,
                            color: i == widget.categoryIndex
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).primaryColor),
                      ),
                    ))
              ]),
          ],
        ));
  }
}
