import 'package:flutter/cupertino.dart';
import 'package:gfghackathon_app/data/providers/doctors_provider.dart';
import 'package:gfghackathon_app/presentation/components/doctors_list_tile.dart';
import 'package:gfghackathon_app/presentation/components/loading.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDoctorsData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                DoctorsListTile(snapshot.data![index]),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
