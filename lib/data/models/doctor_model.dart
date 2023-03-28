// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DoctorModel extends Equatable {
  final String id;
  final String name;
  final String speciality;
  final String workingArea;
  final num pricePerAppointment;
  final String profileImageURL;
  final String gender;
  final num rating;
  final String email;
  final String phoneNumber;
  final String birthdate;
  final num numberOfReviews;
  final String address;
  final String about;
  final num experience;
  const DoctorModel({
    required this.id,
    required this.name,
    required this.speciality,
    required this.workingArea,
    required this.pricePerAppointment,
    required this.profileImageURL,
    required this.gender,
    required this.rating,
    required this.email,
    required this.phoneNumber,
    required this.birthdate,
    required this.numberOfReviews,
    required this.address,
    required this.about,
    required this.experience,
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
      email,
      phoneNumber,
      birthdate,
      numberOfReviews,
      address,
      about,
      experience,
    ];
  }

  DoctorModel copyWith({
    String? id,
    String? name,
    String? speciality,
    String? workingArea,
    num? pricePerAppointment,
    String? profileImageURL,
    String? gender,
    num? rating,
    String? email,
    String? phoneNumber,
    String? birthdate,
    num? numberOfReviews,
    String? address,
    String? about,
    num? experience,
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
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthdate: birthdate ?? this.birthdate,
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      address: address ?? this.address,
      about: about ?? this.about,
      experience: experience ?? this.experience,
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
      'email': email,
      'phoneNumber': phoneNumber,
      'birthdate': birthdate,
      'numberOfReviews': numberOfReviews,
      'address': address,
      'about': about,
      'experience': experience,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      id: '${map['id']}',
      name: map['name'] as String,
      speciality: map['speciality'] as String,
      workingArea: map['workingArea'] as String,
      pricePerAppointment: map['pricePerAppointment'] as num,
      profileImageURL: map['profileImageURL'] as String,
      gender: map['gender'] as String,
      rating: map['rating'] as num,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      birthdate: map['birthdate'] as String,
      numberOfReviews: map['numberOfReviews'] as num,
      address: map['address'] as String,
      about: map['about'] as String,
      experience: map['experience'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
