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
                          "dr. ${doctor.name}",
                          style: const TextStyle(
                            color: Color(0xff28333e),
                            fontSize: 14,
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

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16.0,
                        color: Colors.amber,
                      ),
                    Text(
                    "${doctor.rating} ",
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff74808b),
                        fontWeight: FontWeight.w500,
                      ),

                    ),
                      Text(
                        "(19) reviews ",
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff74808b),
                          fontWeight: FontWeight.w500,
                        ),

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
