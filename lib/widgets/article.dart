import 'package:flutter/material.dart';

class Article extends StatefulWidget {
  final String author;
  final String heading;
  final String content;
  final String date;
  final String imageURL;
  const Article(
      {super.key,
      required this.author,
      required this.heading,
      required this.content,
      required this.date,
      required this.imageURL});
  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.5, color: Color.fromARGB(255, 207, 204, 204)))),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: const Image(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/149/149071.png')),
                    ),
                    Column(
                      children: [
                        Text(widget.author),
                        Text(widget.date),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child:const Icon(Icons.bookmark),
                    ))
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.heading,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.content),
                    ],
                  ),
                ),
                widget.imageURL == "#" ? const SizedBox() : SizedBox(
                  height: 200,
                  child: Image(fit: BoxFit.cover,width: double.infinity,image: NetworkImage(widget.imageURL)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
