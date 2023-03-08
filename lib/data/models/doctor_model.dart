// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DoctorModel extends Equatable {
  final String id;
  final String name;
  final String speciality;
  final String workingArea;
  final int pricePerAppointment;
  final String profileImageURL;
  final String gender;
  final double rating;
  const DoctorModel({
    required this.id,
    required this.name,
    required this.speciality,
    required this.workingArea,
    required this.pricePerAppointment,
    required this.profileImageURL,
    required this.gender,
    required this.rating,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      speciality,
      workingArea,
      pricePerAppointment,
      profileImageURL,
      gender,
      rating,
    ];
  }

  DoctorModel copyWith({
    String? id,
    String? name,
    String? speciality,
    String? workingArea,
    int? pricePerAppointment,
    String? profileImageURL,
    String? gender,
    double? rating,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      speciality: speciality ?? this.speciality,
      workingArea: workingArea ?? this.workingArea,
      pricePerAppointment: pricePerAppointment ?? this.pricePerAppointment,
      profileImageURL: profileImageURL ?? this.profileImageURL,
      gender: gender ?? this.gender,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'speciality': speciality,
      'workingArea': workingArea,
      'pricePerAppointment': pricePerAppointment,
      'profileImageURL': profileImageURL,
      'gender': gender,
      'rating': rating,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      id: map['id'] as String,
      name: map['name'] as String,
      speciality: map['speciality'] as String,
      workingArea: map['workingArea'] as String,
      pricePerAppointment: map['pricePerAppointment'] as int,
      profileImageURL: map['profileImageURL'] as String,
      gender: map['gender'] as String,
      rating: map['rating'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
