import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/providers/doctors_provider.dart';
import 'package:gfghackathon_app/presentation/components/temp_component.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDoctorsData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Column(
            children: [
              TempWidget(),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
