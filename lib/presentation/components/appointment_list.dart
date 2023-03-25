import 'package:flutter/cupertino.dart';
import 'package:gfghackathon_app/data/models/appointment_model.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';
import 'package:gfghackathon_app/data/providers/appointment_data_provider.dart';
import 'package:gfghackathon_app/presentation/components/appointment_list_tile.dart';

import 'loading.dart';

class AppointmentList extends StatelessWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAppointmentData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AppointmentModel> appointments = snapshot.data![0];
            Map<String, DoctorModel> doctorsMap = snapshot.data![1];
            return ListView.builder(
              itemCount: appointments.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => AppointmentListTile(
                  appointments[index],
                  doctorsMap[appointments[index].doctorID]!),
            );
          } else {
            return const LoadingWidget();
          }
        });
  }
}