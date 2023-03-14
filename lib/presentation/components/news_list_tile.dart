import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/news_model.dart';
import 'package:gfghackathon_app/presentation/pages/news_web_page.dart';
import 'package:intl/intl.dart';

class NewsListTile extends StatelessWidget {
  final NewsModel news;
  const NewsListTile(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NewsWebView(news.link)));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffe5e8eb),
                      ),
                      child: const Center(
                        child: Text(
                          "No Image",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff28333e),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: DateFormat("MMMM d, y")
                                  .format(DateTime.parse(news.publishedDate)),
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff5d6974),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: " - ${news.author}",
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff5d6974),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
