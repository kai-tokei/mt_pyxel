import 'package:flutter/material.dart';

class CommonSearchBox extends StatelessWidget {
  const CommonSearchBox({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 235,
      height: 45,
      child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
              label: const Text("Search", style: TextStyle(fontSize: 18)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).primaryColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).primaryColor)))),
    );
  }
}
