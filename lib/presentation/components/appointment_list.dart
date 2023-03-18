import 'package:flutter/cupertino.dart';
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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  AppointmentListTile(snapshot.data![index]),
            );
          }
          else {
            return const LoadingWidget();
          }
        }
    );
  }
}