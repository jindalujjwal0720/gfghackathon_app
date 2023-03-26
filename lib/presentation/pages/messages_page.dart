import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/mock/mock_data.dart';
import 'package:gfghackathon_app/data/models/chatroom_model.dart';
import 'package:gfghackathon_app/data/models/message_model.dart';
import 'package:gfghackathon_app/presentation/components/loading.dart';
import 'package:gfghackathon_app/presentation/components/message_bubble.dart';
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
            // list of messages
            child: FutureBuilder(
              future: Future.delayed(Duration.zero, () {
                return chatsData.map((e) => MessageModel.fromMap(e)).toList();
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MessageBubble(snapshot.data![index]),
                      ),
                    ),
                  );
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.background,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 160.0,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColors.white,
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your message...",
                        ),
                        cursorColor: AppColors.activeBlue,
                        maxLines: null,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_rounded,
                    color: AppColors.activeBlue,
                    size: 20.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
