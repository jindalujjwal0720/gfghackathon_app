import 'package:flutter/cupertino.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';

class DoctorsListTile extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorsListTile(this.doctor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(doctor.name);
  }
}
