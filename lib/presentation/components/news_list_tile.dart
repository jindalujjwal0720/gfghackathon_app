import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/news_model.dart';

class NewsListTile extends StatelessWidget {
  final NewsModel news;
  const NewsListTile(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(10),
             child: Image.network(
               news.imageURL,
               height: 80.0,
               width: 80.0,
               fit: BoxFit.cover,
             ),
           ),
         ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               mainAxisSize: MainAxisSize.min,
               children: [
                 Expanded(
                   child: Text(
                     news.title,
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                       fontSize: 16
                     ),
                     textAlign: TextAlign.start,
                       maxLines: 1,
                       overflow: TextOverflow.fade
                   ),
                 ),
               ],
             ),

           ],
         )

        ],
      )
    );
  }
}
