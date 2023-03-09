import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';

class DoctorsListTile extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorsListTile(this.doctor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                doctor.profileImageURL,
                width: 64.0,
                height: 64.0,
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
                          doctor.name,
                          style: const TextStyle(
                            color: Color(0xff28333e),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${doctor.rating} ",
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff74808b),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              size: 16.0,
                              color: Color(0xff5d6974),
                            ),
                          ],
                        )
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
                          ),
                        ),
                        TextSpan(
                          text: " - ${doctor.workingArea}",
                        ),
                      ],
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff74808b),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Text(
                          "₹ ${doctor.pricePerAppointment}",
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: Color(0xff74808b),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: const Color(0x0d0D47A1),
                          ),
                          child: const Text(
                            "Appointment",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF0D47A1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
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
