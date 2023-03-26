// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChatroomModel extends Equatable {
  final String id;
  final String doctorID;
  final String patientID;
  final String doctorName;
  final String patientName;
  final String doctorProfilePicURL;
  final String patientProfilePicURL;
  final String lastMessage;
  final String createdAt;
  const ChatroomModel({
    required this.id,
    required this.doctorID,
    required this.patientID,
    required this.doctorName,
    required this.patientName,
    required this.doctorProfilePicURL,
    required this.patientProfilePicURL,
    required this.lastMessage,
    required this.createdAt,
  });

  ChatroomModel copyWith({
    String? id,
    String? doctorID,
    String? patientID,
    String? doctorName,
    String? patientName,
    String? doctorProfilePicURL,
    String? patientProfilePicURL,
    String? lastMessage,
    String? createdAt,
  }) {
    return ChatroomModel(
      id: id ?? this.id,
      doctorID: doctorID ?? this.doctorID,
      patientID: patientID ?? this.patientID,
      doctorName: doctorName ?? this.doctorName,
      patientName: patientName ?? this.patientName,
      doctorProfilePicURL: doctorProfilePicURL ?? this.doctorProfilePicURL,
      patientProfilePicURL: patientProfilePicURL ?? this.patientProfilePicURL,
      lastMessage: lastMessage ?? this.lastMessage,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'doctorID': doctorID,
      'patientID': patientID,
      'doctorName': doctorName,
      'patientName': patientName,
      'doctorProfilePicURL': doctorProfilePicURL,
      'patientProfilePicURL': patientProfilePicURL,
      'lastMessage': lastMessage,
      'createdAt': createdAt,
    };
  }

  factory ChatroomModel.fromMap(Map<String, dynamic> map) {
    return ChatroomModel(
      id: map['id'] as String,
      doctorID: '${map['doctorID']}',
      patientID: '${map['patientID']}',
      doctorName: map['doctorName'] as String,
      patientName: map['patientName'] as String,
      doctorProfilePicURL: map['doctorProfilePicURL'] as String,
      patientProfilePicURL: map['patientProfilePicURL'] as String,
      lastMessage: map['lastMessage'] as String,
      createdAt: '${map['createdAt']}',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatroomModel.fromJson(String source) =>
      ChatroomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      doctorID,
      patientID,
      doctorName,
      patientName,
      doctorProfilePicURL,
      patientProfilePicURL,
      lastMessage,
      createdAt,
    ];
  }
}
