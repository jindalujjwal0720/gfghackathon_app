import 'package:gfghackathon_app/data/models/appointment_model.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';
import '../mock/mock_data.dart';

Future<List<dynamic>> getAppointmentData() async {
  // returning mock data for now
  List<AppointmentModel> appointmentList = [];
  appointmentList =
      appointmentsData.map((obj) => AppointmentModel.fromMap(obj)).toList();
  List<DoctorModel> doctorsList =
      doctorsData.map((e) => DoctorModel.fromMap(e)).toList();
  Map<String, DoctorModel> doctorsMap = {};
  for (var element in doctorsList) {
    doctorsMap[element.id] = element;
  }
  return [appointmentList, doctorsMap];
}
