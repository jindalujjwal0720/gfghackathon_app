import 'package:flutter/material.dart';
import 'package:gfghackathon_app/presentation/components/doctors_list.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing Page"),
      ),
      backgroundColor: const Color(0xfff6f7f8),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            DoctorsList(),
          ],
        ),
      ),
    );
  }
}
