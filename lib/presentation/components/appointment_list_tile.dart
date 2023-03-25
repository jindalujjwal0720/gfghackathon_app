import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/appointment_model.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';
import 'package:gfghackathon_app/utils/app_colors.dart';
import 'package:intl/intl.dart';

class AppointmentListTile extends StatelessWidget {
  const AppointmentListTile(this.appointment, this.doctor,
      {this.backgroundColor = Colors.white,
      this.showOptions = true,
      super.key});
  final AppointmentModel appointment;
  final DoctorModel doctor;
  final Color backgroundColor;
  final bool showOptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 3),
            spreadRadius: -2,
            blurRadius: 16,
            color: Color.fromRGBO(210, 229, 255, 1),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                doctor.profileImageURL,
                width: 64.0,
                height: 64.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 2.0),
                  child: Text(
                    "Dr. ${doctor.name}",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 2.0),
                  child: Text(
                    doctor.speciality,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: dateTimeRowWidget(
                      appointment.startTime, appointment.duration),
                ),
                if (showOptions)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 7.0, horizontal: 24.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: AppColors.grey,
                                width: 1.0,
                              ),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(left: 12.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 7.0, horizontal: 24.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: AppColors.activeBlue,
                                width: 1.0,
                              ),
                            ),
                            child: const Text(
                              "Reschedule",
                              style: TextStyle(
                                color: AppColors.activeBlue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget dateTimeRowWidget(timestamp, duration) {
  DateTime datetime = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: AppColors.backgroundMedium,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: FittedBox(
      child: Row(
        children: [
          const Icon(
            Icons.calendar_month_outlined,
            size: 17.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 8.0),
            child: Text(
              DateFormat("dd MMM yyyy").format(datetime),
              style: const TextStyle(
                fontSize: 13.0,
              ),
            ),
          ),
          const Icon(
            Icons.watch_later_outlined,
            size: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              DateFormat("jm").format(datetime),
              style: const TextStyle(
                fontSize: 13.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
