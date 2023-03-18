import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/appointment_model.dart';
import 'package:gfghackathon_app/utils/appColors.dart';

class AppointmentListTile extends StatelessWidget {
  final AppointmentModel appointment ;
  const AppointmentListTile(this.appointment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimeRow();
  }



  Widget DateTimeRow() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 6),
      decoration:BoxDecoration(
        color: AppColors.bluegrey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
           const Icon(Icons.calendar_month),
            Text(
              convertDateToString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
           Expanded(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8.0),
                   child: const Icon(Icons.access_time),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                   child: Text(
                     convertTimeToString(),
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w600,
                       fontStyle: FontStyle.italic,
                     ),
                   ),
                 ),
               ],
             ),
           )
          ],
        ),
      ),

    );
}



String convertDateToString() {
    int milliseconds  = int.parse(appointment.startTime);
    final now = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    String s ="";
    if((now.year) - (dateTime.year) == 0) {
      if((dateTime.month) - (now.month) == 0) {
        if ((now.day) - (dateTime.day) == 1)
          s = "Tomorrow";
        else if ((now.day) - (dateTime.day) == 0)
          s = "Today";
        else if ((now.day) - (dateTime.day) == -1)
          s = "Yesterday";
        else if ((now.day) - (dateTime.day) > 1)
          s = " ${(now.day) - (dateTime.day)} days";
        else
          s = "missed";
      }
      else if((dateTime.month) - (now.month) < 0)
          s ="${(dateTime.year) - (now.year)} months before";
      else
        s ="${(dateTime.year) - (now.year)} months left";
    }
    else if((dateTime.year) - (now.year)<0)
         s =  "${(dateTime.year) - (now.year)} years before";
    else
         s =  "${(dateTime.year) - (now.year)} years left";

    // print(s);
    return s;
   }
  String convertTimeToString()
  {
    int milliseconds  = int.parse(appointment.startTime);
    // final now = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    String s ="";
    s = "${dateTime.hour}:${dateTime.minute} -${dateTime.hour+2}:${dateTime.minute} AM";
    return s;
  }
}




// int compareDate(DateTime now, DateTime  dateTime) {
// }