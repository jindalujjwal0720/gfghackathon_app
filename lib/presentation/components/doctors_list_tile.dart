import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';
import 'package:gfghackathon_app/utils/app_colors.dart';

class DoctorsListTile extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorsListTile(this.doctor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 3),
            spreadRadius: -4,
            blurRadius: 6,
            color: Color.fromRGBO(210, 229, 255, 1),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                doctor.profileImageURL,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dr. ${doctor.name}",
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: doctor.speciality,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ),
                        // TextSpan(
                        //   text: " - ${doctor.workingArea}",
                        // ),
                      ],
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff74808b),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 6.0),
                          child: Icon(
                            Icons.star_rounded,
                            size: 18.0,
                            color: Colors.amber,
                          ),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "${doctor.rating} ",
                              style: const TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: " (${doctor.numberOfReviews} Reviews)",
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
