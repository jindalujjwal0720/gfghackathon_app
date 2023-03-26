// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String id;
  final String sentByID;
  final String message;
  final String timestamp;
  const MessageModel({
    required this.id,
    required this.sentByID,
    required this.message,
    required this.timestamp,
  });

  MessageModel copyWith({
    String? id,
    String? sentByID,
    String? message,
    String? timestamp,
  }) {
    return MessageModel(
      id: id ?? this.id,
      sentByID: sentByID ?? this.sentByID,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sentByID': sentByID,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      sentByID: '${map['sentByID']}',
      message: map['message'] as String,
      timestamp: map['timestamp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, sentByID, message, timestamp];
}
