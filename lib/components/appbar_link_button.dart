import 'package:flutter/material.dart';

class AppBarLinkButton extends StatelessWidget {
  const AppBarLinkButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(label,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary, fontSize: 28)));
  }
}
