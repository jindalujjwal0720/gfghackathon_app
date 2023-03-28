import 'dart:convert';
import 'dart:developer' as logger;
import 'package:gfghackathon_app/data/mock/mock_data.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<DoctorModel>> getDoctorsData() async {
  // mock data for UI
  try {
    return doctorsData.map((e) => DoctorModel.fromMap(e)).toList();
  } catch (e) {
    print(e);
  }
  // fetching the doctors data
  List<DoctorModel> doctorsList = [];
  try {
    var response = await http
        .get(Uri.parse('${dotenv.env["API_BASE_URL"]}/doctors'), headers: {
      "content-type": "application/json",
    });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var doctorsData = jsonDecode(response.body);
      doctorsList = doctorsData
          .map<DoctorModel>((obj) => DoctorModel.fromMap(obj))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Doctors Data - getDoctorsData()');
    }
  } catch (e) {
    logger.log(e.toString());
  }
  return doctorsList;
}