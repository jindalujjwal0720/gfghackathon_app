import 'package:gfghackathon_app/data/models/doctor_model.dart';

import '../mock/mock_data.dart';

Future<List<DoctorModel>> getDoctorsData() async {
  // returning mock data for now
  List<DoctorModel> doctorsList = [];
  doctorsList = doctorsData.map((obj) => DoctorModel.fromMap(obj)).toList();
  await Future.delayed(const Duration(seconds: 1));
  return doctorsList;
}
