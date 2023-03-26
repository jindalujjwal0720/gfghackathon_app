import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/constants/user.dart';
import 'package:gfghackathon_app/data/models/message_model.dart';
import 'package:gfghackathon_app/utils/app_colors.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message, {super.key});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sentByID == userConstants.user.id
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          crossAxisAlignment: message.sentByID == userConstants.user.id
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: message.sentByID == userConstants.user.id
                    ? const Color.fromARGB(255, 225, 233, 253)
                    : AppColors.componentsBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                message.message,
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 0.5,
                  color: message.sentByID == userConstants.user.id
                      ? AppColors.black
                      : AppColors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                DateFormat("jm").format(DateTime.parse(message.timestamp)),
                style: const TextStyle(
                  fontSize: 12.0,
                  color: AppColors.grey,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
