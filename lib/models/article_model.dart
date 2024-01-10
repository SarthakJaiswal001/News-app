class ArticleModel {
  late String heading;
  late String author;
  late String content;
  late String date;
  late String imageURL;
  ArticleModel({
    required this.heading,
    required this.author,
    required this.content,
    required this.date,
    required this.imageURL,
  }) {
    if (author.length > 35) {
      author = '${author.substring(0, 35)}...';
    }
  }
}
