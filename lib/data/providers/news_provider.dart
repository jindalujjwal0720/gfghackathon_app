
import 'package:gfghackathon_app/data/mock/mock_news.dart';
import 'package:gfghackathon_app/data/models/news_model.dart';

Future<List<NewsModel>> getNewsData() async {
  // returning mock data for now
  List<NewsModel> newsList = [];
  newsList = newsData.map((obj) => NewsModel.fromMap(obj)).toList();
  await Future.delayed(const Duration(seconds: 1));
  return newsList;
}