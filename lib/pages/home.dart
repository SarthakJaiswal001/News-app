import 'package:flutter/material.dart';
import '../widgets/article.dart';
import '../widgets/navbtn.dart';
import '../services/fetch_article.dart';
import '../models/article_model.dart';

class Home extends StatefulWidget {
  final List<String> categoriesList = [
    'For you',
    'Sports',
    'Entertaiment',
    'Health',
    'Technology',
    'Business'
  ];
  Home({super.key});
  final NewsService service = NewsService();
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int current = 0;
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;
  List<dynamic> articleList = [];
  dynamic themeColor = Colors.blue[900];
  dynamic backgroundColor = const Color.fromARGB(255, 207, 204, 204);

  @override
  initState() {
    widget.service.fetchArticle(getData, current);
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset >= 100) {
          setState(
              () => _showBackToTopButton = true); // show the back-to-top button
        } else if (_scrollController.offset < 101) {
          setState(() =>
              _showBackToTopButton = false); // hide the back-to-top button
        }
      });

    super.initState();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void getData(List dataList) {
    setState(() {
      articleList = dataList.map((article) {
        return ArticleModel(
            heading: article['title'] ?? "--",
            author: article['author'] ?? "--",
            content: article['description'] ?? "--",
            date: article['publishedAt'] ?? "--",
            imageURL: article['urlToImage'] ?? "#",
            );
      }).toList();
    });
  }

  void pressState(int index) {
    setState(() {
      current = index;
      articleList = [];
      widget.service.fetchArticle(getData, current);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: backgroundColor,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: themeColor,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.categoriesList
                        .asMap()
                        .entries
                        .map((categoryEntry) {
                      return Navbtn(
                          label: categoryEntry.value,
                          index: categoryEntry.key,
                          current: current,
                          stateChange: pressState);
                    }).toList(),
                  ),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white),
                  child: Column(
                    children: articleList.isNotEmpty
                        ? articleList.map((articleObj) {
                            return Article(
                                author: articleObj.author,
                                heading: articleObj.heading,
                                content: articleObj.content,
                                date: articleObj.date,
                                imageURL: articleObj.imageURL,
                                );
                          }).toList()
                        : [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: AlignmentDirectional.center,
                              color: backgroundColor,
                              child: const Text("Loading..."))
                          ],
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: themeColor,
              child: const Icon(Icons.arrow_upward),
            ),
    );
  }
}
