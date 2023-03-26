// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:gfghackathon_app/data/models/patient_model.dart';

class UserConstants extends Equatable {
  final PatientModel user;
  const UserConstants({
    required this.user,
  });

  UserConstants copyWith({
    PatientModel? user,
  }) {
    return UserConstants(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
    };
  }

  factory UserConstants.fromMap(Map<String, dynamic> map) {
    return UserConstants(
      user: PatientModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserConstants.fromJson(String source) =>
      UserConstants.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserConstants(user: $user)';

  @override
  bool operator ==(covariant UserConstants other) {
    if (identical(this, other)) return true;

    return other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  List<Object> get props => [user];

  @override
  bool get stringify => true;
}

UserConstants userConstants = UserConstants(
  user: PatientModel.fromMap(
    const {
      "id": 5,
      "name": "Gayla Maddra",
      "gender": "Female",
      "phoneNumber": "298 595 3042",
      "email": "gmaddra2@mlb.com",
      "profilePicURL": "https://source.unsplash.com/random/300x200/?user",
      "age": 48,
      "height": 170,
      "weight": 70,
      "birthdate": 1596846196000,
      "fullAddress": "63 Stuart Parkway",
      "createdAt": 1609457220000,
    },
  ),
);
