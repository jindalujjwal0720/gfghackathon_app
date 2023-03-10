// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  final String id;
  final String headline;
  final String url;
  final String imageUrl;
  final String content;
  const NewsModel({
    required this.id,
    required this.headline,
    required this.url,
    required this.imageUrl,
    required this.content,
  });

  @override
  List<Object> get props {
    return [
      id,
      headline,
      url,
      imageUrl,
      content,
    ];
  }

  NewsModel copyWith({
    String? id,
    String? headline,
    String? url,
    String? imageUrl,
    String? content,
  }) {
    return NewsModel(
      id: id ?? this.id,
      headline: headline ?? this.headline,
      url: url ?? this.url,
     imageUrl: imageUrl ?? this.imageUrl,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': id,
      'title': headline,
      'imageUrl': imageUrl,
      'url': url,
      'cnt': content,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['author'] as String,
      headline : map['title'] as String,
      url: map['url'] as String,
      imageUrl: map['imageUrl'] as String,
     content: map['cnt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
