import 'package:flutter/material.dart';
import 'package:gfghackathon_app/presentation/components/appointment_list.dart';
import 'package:gfghackathon_app/utils/app_colors.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.black,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(top: 24.0, bottom: 0.0),
            child: Text(
              "Schedule",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22.0,
              ),
            ),
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  size: 24,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: AppointmentList(),
            ),
          ],
        ),
      ),
    );
  }
}
