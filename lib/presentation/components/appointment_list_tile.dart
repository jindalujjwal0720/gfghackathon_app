import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/appointment_model.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';
import 'package:gfghackathon_app/utils/app_colors.dart';
import 'package:intl/intl.dart';

class AppointmentListTile extends StatelessWidget {
  const AppointmentListTile(this.appointment, this.doctor,
      {this.showOptions = true, this.invert = false, super.key});
  final AppointmentModel appointment;
  final DoctorModel doctor;
  final bool showOptions;
  final bool invert;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: invert ? AppColors.darkblue : AppColors.componentsBackground,
        borderRadius: BorderRadius.circular(16.0),
        // outer shadow
        boxShadow: invert
            ? [
                const BoxShadow(
                  color: Color.fromARGB(255, 173, 188, 248),
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ]
            : [
                const BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255),
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255),
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
        // inner shadow
        gradient: invert
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.darkblue,
                  Color.fromARGB(255, 76, 98, 186),
                ],
              )
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 246, 248, 255),
                  Color.fromARGB(255, 244, 247, 254),
                ],
              ),
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
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: invert ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 2.0),
                  child: Text(
                    doctor.speciality,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: invert
                          ? const Color.fromARGB(255, 212, 212, 254)
                          : AppColors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: dateTimeRowWidget(
                    appointment.startTime,
                    appointment.duration,
                    invert: invert,
                  ),
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

Widget dateTimeRowWidget(timestamp, duration, {invert = false}) {
  DateTime datetime = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: invert
          ? const Color.fromARGB(66, 11, 35, 84)
          : const Color.fromARGB(255, 223, 232, 253),
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: FittedBox(
      child: Row(
        children: [
          Icon(
            Icons.calendar_month_outlined,
            size: 17.0,
            color: invert ? AppColors.white : AppColors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 8.0),
            child: Text(
              DateFormat("dd MMM yyyy").format(datetime),
              style: TextStyle(
                fontSize: 13.0,
                color: invert ? AppColors.white : AppColors.black,
              ),
            ),
          ),
          Icon(
            Icons.watch_later_outlined,
            size: 16.0,
            color: invert ? AppColors.white : AppColors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              DateFormat("jm").format(datetime),
              style: TextStyle(
                fontSize: 13.0,
                color: invert ? AppColors.white : AppColors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
