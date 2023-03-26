import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/chatroom_model.dart';
import 'package:gfghackathon_app/utils/app_colors.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage(this.chatroom, {super.key});
  final ChatroomModel chatroom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.black,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 0.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    chatroom.doctorProfilePicURL,
                    width: 36.0,
                    height: 36.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Dr. ${chatroom.doctorName}",
                    style: const TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz_outlined,
                  size: 24,
                  color: AppColors.textGrey,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          const Text("Hello"),
        ],
      ),
    );
  }
}
