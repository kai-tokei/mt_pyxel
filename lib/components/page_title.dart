import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
      Row(
        children: [
          const SizedBox(width: 84),
          Text(title, style: const TextStyle(fontSize: 48)),
          const Expanded(child: SizedBox()),
          const SizedBox(width: 84),
        ],
      ),
      Divider(thickness: 2.5, color: Theme.of(context).colorScheme.secondary),
    ]);
  }
}
