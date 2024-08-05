import 'package:flutter/material.dart';

class SinglelineTextField extends StatelessWidget {
  const SinglelineTextField({
    super.key,
    required this.onChanged,
    this.width = 500,
  });

  final Function(dynamic) onChanged;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: TextField(
            onChanged: onChanged,
            style: const TextStyle(fontSize: 20),
            maxLength: 84,
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
                    borderRadius: BorderRadius.circular(0)))));
  }
}
