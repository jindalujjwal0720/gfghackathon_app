import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';

class DoctorsListTile extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorsListTile(this.doctor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: NetworkImage(doctor.profileImageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 40,),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(doctor.name),
                   SizedBox(width: 40,),
                   Text(doctor.rating.toString()),
                   Icon(Icons.star,color: Colors.yellow,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(doctor.speciality),
              ),
              Text(doctor.workingArea),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.currency_rupee,size: 15),
                  Text(doctor.pricePerAppointment.toString()),
                  TextButton(onPressed: (){}, child:

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("Appointment"),
                  ),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:MaterialStateProperty.all<Color>(Colors.white)
                  ),)
                ],
              ),

            ],
          ),
        ],
      ),
    );

  }
}
