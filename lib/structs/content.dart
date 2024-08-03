import 'package:flutter/material.dart';

class Content {
  const Content({
    required this.title,
    required this.author,
    required this.image,
    required this.likes,
    required this.comments,
    required this.desc,
  });

  final String title;
  final String author;
  final Widget image;
  final String likes;
  final List<String> comments;
  final String desc;
}
