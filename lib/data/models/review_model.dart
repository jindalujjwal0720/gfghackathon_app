// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String id;
  final String title;
  final String body;
  final String doctorID;
  final String patientID;
  final String timestamp;
  final int rating;
  const ReviewModel({
    required this.id,
    required this.title,
    required this.body,
    required this.doctorID,
    required this.patientID,
    required this.timestamp,
    required this.rating,
  });

  ReviewModel copyWith({
    String? id,
    String? title,
    String? body,
    String? doctorID,
    String? patientID,
    String? timestamp,
    int? rating,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      doctorID: doctorID ?? this.doctorID,
      patientID: patientID ?? this.patientID,
      timestamp: timestamp ?? this.timestamp,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'doctorID': doctorID,
      'patientID': patientID,
      'timestamp': timestamp,
      'rating': rating,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      id: '${map['id']}',
      title: map['title'] as String,
      body: map['body'] as String,
      doctorID: '${map['doctorID']}',
      patientID: '${map['patientID']}',
      timestamp: map['timestamp'] as String,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      title,
      body,
      doctorID,
      patientID,
      timestamp,
      rating,
    ];
  }
}
