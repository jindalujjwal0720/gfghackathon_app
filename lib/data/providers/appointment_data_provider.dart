import 'package:gfghackathon_app/data/models/appointment_model.dart';
import '../mock/mock_data.dart';

Future<List<AppointmentModel>> getAppointmentData() async {
  // returning mock data for now
  List<AppointmentModel> AppointmentList = [];
  AppointmentList = appointmentsData.map((obj) => AppointmentModel.fromMap(obj)).toList();
  await Future.delayed(const Duration(seconds: 1));
  print(AppointmentList);
  return AppointmentList;
}
