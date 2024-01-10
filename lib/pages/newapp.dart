import 'package:flutter/material.dart';
import 'home.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News APP"),
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Home(),
    );
  }
}
