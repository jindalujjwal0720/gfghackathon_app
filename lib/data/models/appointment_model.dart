// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppointmentModel extends Equatable {
  final String id;
  final String doctorID;
  final String userID;
  final String startTime;
  final String status;
  final int duration;
  const AppointmentModel({
    required this.id,
    required this.doctorID,
    required this.userID,
    required this.startTime,
    required this.duration,
    required this.status,
  });

  @override
  List<Object> get props {
    return [
      id,
      doctorID,
      userID,
      startTime,
      duration,
      status,
    ];
  }

  AppointmentModel copyWith({
    String? id,
    String? doctorID,
    String? userID,
    String? startTime,
    String? status,
    int? duration,

  }) {
    return AppointmentModel(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      doctorID: doctorID ?? this.doctorID,
      startTime: startTime ?? this.startTime,
      status: status ?? this.status,
      duration: duration?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'doctorID': doctorID,
      'userID': userID,
      'startTime':startTime,
      'status':status,
      'duration': duration,

    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] as String,
      doctorID: map['doctorID'] as String,
      userID: map['userID'] as String,
      status: map['status'] as String,
      startTime: map['startTime'] as String,
      duration: map['duration'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentModel.fromJson(String source) =>
      AppointmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
