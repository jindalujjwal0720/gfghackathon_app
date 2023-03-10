import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/news_model.dart';

class NewsListTile extends StatelessWidget {
  final NewsModel news;
  const NewsListTile(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(news.title),
    );
  }
}
