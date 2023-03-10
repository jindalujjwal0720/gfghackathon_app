// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  final String id;
  final String title;
  final String author;
  final String publishedDate;
  final String link;
  final String excerpt;
  final String summary;
  final String imageURL;
  const NewsModel({
    required this.id,
    required this.title,
    required this.author,
    required this.publishedDate,
    required this.link,
    required this.excerpt,
    required this.summary,
    required this.imageURL,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      author,
      publishedDate,
      link,
      excerpt,
      summary,
      imageURL,
    ];
  }

  NewsModel copyWith({
    String? id,
    String? title,
    String? author,
    String? publishedDate,
    String? link,
    String? excerpt,
    String? summary,
    String? imageURL,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      publishedDate: publishedDate ?? this.publishedDate,
      link: link ?? this.link,
      excerpt: excerpt ?? this.excerpt,
      summary: summary ?? this.summary,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'title': title,
      'author': author,
      'published_date': publishedDate,
      'link': link,
      'excerpt': excerpt,
      'summary': summary,
      'media': imageURL,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['_id'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      publishedDate: map['published_date'] as String,
      link: map['link'] as String,
      excerpt: map['excerpt'] as String,
      summary: map['summary'] as String,
      imageURL: map['media'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
