import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/constants/user.dart';
import 'package:gfghackathon_app/data/models/appointment_model.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';
import 'package:gfghackathon_app/presentation/components/appointment_list_tile.dart';
import 'package:gfghackathon_app/presentation/components/doctors_list.dart';
import 'package:gfghackathon_app/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.black,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 0.0),
            child: Text(
              "Hi, ${userConstants.user.name}",
              style: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22.0,
              ),
            ),
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    size: 24,
                  )),
            )
          ],
          bottom: const PreferredSize(
            preferredSize: Size.zero,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 18.0, bottom: 12.0),
                child: Text(
                  "How are you feeling today?",
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // If any appointment is today
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: AppointmentListTile(
                AppointmentModel.fromMap(const {
                  "id": "01GWCSGPPT4HGBXKEVHVB6Y170",
                  "doctorID": 6,
                  "patientID": 12,
                  "startTime": "1682660708000",
                  "duration": 60,
                  "status": "approved",
                  "symptoms": "vomiting"
                }),
                DoctorModel.fromMap(
                  const {
                    "id": 6,
                    "name": "Hardy Clementucci",
                    "speciality": "Critical Care Medicine Specialist",
                    "workingArea": "Nelco Laboratories, Inc.",
                    "pricePerAppointment": 814,
                    "profileImageURL":
                        "https://source.unsplash.com/random/400x600/?doctor",
                    "gender": "Male",
                    "rating": 3.8,
                    "email": "hclementucci5@google.es",
                    "phoneNumber": "493 484 5126",
                    "birthdate": "1654645342000",
                    "numberOfReviews": 3
                  },
                ),
                showOptions: false,
              ),
            ),
            // Normal Section for less important pages - find medecine

            // Find doctors sections
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Find Doctors",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            const DoctorsList()
          ],
        ),
      ),
    );
  }
}
