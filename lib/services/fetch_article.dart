import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final dio = Dio();

class NewsService {
  List<String> categories = [
    "general",
    "sports",
    "entertainment",
    "health",
    "technology",
    "business"
  ];
  List<dynamic> dataList = [];
  void fetchArticle(callback, index) async {
    try {Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=in&pageSize=15&category=${categories[index]}&apiKey=${dotenv.env['API_KEY']}');
    dataList = response.data['articles'];} on Error {
      print(Error);
    }
    callback(dataList);
  }
}
