// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PatientModel extends Equatable {
  final String id;
  final String name;
  final String gender;
  final String phoneNumber;
  final String email;
  final String profilePicURL;
  final int age;
  final int height;
  final int weight;
  final int birthdate;
  final String fullAddress;
  final int createdAt;
  const PatientModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.profilePicURL,
    required this.age,
    required this.height,
    required this.weight,
    required this.birthdate,
    required this.fullAddress,
    required this.createdAt,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      gender,
      phoneNumber,
      email,
      profilePicURL,
      age,
      height,
      weight,
      birthdate,
      fullAddress,
      createdAt,
    ];
  }

  PatientModel copyWith({
    String? id,
    String? name,
    String? gender,
    String? phoneNumber,
    String? email,
    String? profilePicURL,
    int? age,
    int? height,
    int? weight,
    int? birthdate,
    String? fullAddress,
    int? createdAt,
  }) {
    return PatientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      profilePicURL: profilePicURL ?? this.profilePicURL,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      birthdate: birthdate ?? this.birthdate,
      fullAddress: fullAddress ?? this.fullAddress,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'email': email,
      'profilePicURL': profilePicURL,
      'age': age,
      'height': height,
      'weight': weight,
      'birthdate': birthdate,
      'fullAddress': fullAddress,
      'createdAt': createdAt,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      id: '${map['id']}',
      name: map['name'] as String,
      gender: map['gender'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      profilePicURL: map['profilePicURL'] as String,
      age: map['age'] as int,
      height: map['height'] as int,
      weight: map['weight'] as int,
      birthdate: map['birthdate'] as int,
      fullAddress: map['fullAddress'] as String,
      createdAt: map['createdAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientModel.fromJson(String source) =>
      PatientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
