import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/news_model.dart';

class NewsListTile extends StatelessWidget {
  final NewsModel news;
  const NewsListTile(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child:Column(
        children: [
           Padding(
             padding: const EdgeInsets.all(2.0),
             child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                news.imageUrl,
                fit: BoxFit.cover,
              ),
          ),
           ),


        ],
      ),

    );
  }
}
