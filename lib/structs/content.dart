class Content {
  Content(
      {required this.id,
      required this.title,
      required this.author,
      required this.image,
      required this.likes,
      required this.comments,
      required this.desc,
      required this.kind,
      required this.executeLink});

  final String id;
  final String executeLink;
  final String title;
  final String author;
  final dynamic image;
  int likes;
  final int comments;
  final String desc;
  final String kind;
}
