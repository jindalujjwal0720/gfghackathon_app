// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppointmentModel extends Equatable {
  final String id;
  final String doctorID;
  final String patientID;
  final String startTime;
  final String status;
  final int duration;
  final String symptoms;
  const AppointmentModel({
    required this.id,
    required this.doctorID,
    required this.patientID,
    required this.startTime,
    required this.status,
    required this.duration,
    required this.symptoms,
  });

  @override
  List<Object> get props {
    return [
      id,
      doctorID,
      patientID,
      startTime,
      status,
      duration,
      symptoms,
    ];
  }

  AppointmentModel copyWith({
    String? id,
    String? doctorID,
    String? patientID,
    String? startTime,
    String? status,
    int? duration,
    String? symptoms,
  }) {
    return AppointmentModel(
      id: id ?? this.id,
      doctorID: doctorID ?? this.doctorID,
      patientID: patientID ?? this.patientID,
      startTime: startTime ?? this.startTime,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      symptoms: symptoms ?? this.symptoms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'doctorID': doctorID,
      'patientID': patientID,
      'startTime': startTime,
      'status': status,
      'duration': duration,
      'symptoms': symptoms,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] as String,
      doctorID: "${map['doctorID']}",
      patientID: "${map['patientID']}",
      startTime: map['startTime'] as String,
      status: map['status'] as String,
      duration: map['duration'] as int,
      symptoms: map['symptoms'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentModel.fromJson(String source) =>
      AppointmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
