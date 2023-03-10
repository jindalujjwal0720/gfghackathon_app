import 'package:gfghackathon_app/data/mock/mock_data.dart';
import 'package:gfghackathon_app/data/models/news_model.dart';

Future<List<NewsModel>> getNewsData() async {
  // returning mock data for now
  List<NewsModel> newsList = [];
  List news = newsData["articles"] as List<dynamic>;
  newsList = news.map((e) => NewsModel.fromMap(e)).toList();
  await Future.delayed(const Duration(seconds: 1));
  return newsList;
}
