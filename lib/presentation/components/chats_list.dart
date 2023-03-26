import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/chatroom_model.dart';
import 'package:gfghackathon_app/data/providers/chats_list_provider.dart';
import 'package:gfghackathon_app/presentation/components/chats_list_tile.dart';
import 'package:gfghackathon_app/presentation/components/loading.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 1000), () {
        return [
          ChatroomModel(
              id: "fanelifcacnxawodqenacqxo",
              doctorID: "3",
              patientID: "5",
              doctorName: "Sulivan Angel",
              patientName: "Ujjwal Jindal",
              createdAt: DateTime.now().toIso8601String(),
              lastMessage: "Doctor, i need help regarding my old issue",
              doctorProfilePicURL:
                  "https://source.unsplash.com/random/300x300/?q=doctor",
              patientProfilePicURL:
                  "https://source.unsplash.com/random/300x300/?q=patient"),
          ChatroomModel(
              id: "fanelifcacnxawodqenacqxo",
              doctorID: "3",
              patientID: "5",
              doctorName: "Sulivan Angel",
              patientName: "Ujjwal Jindal",
              createdAt: DateTime.now().toIso8601String(),
              lastMessage: "Doctor, i need help regarding my old issue",
              doctorProfilePicURL:
                  "https://source.unsplash.com/random/300x300/?q=doctor",
              patientProfilePicURL:
                  "https://source.unsplash.com/random/300x300/?q=patient"),
          ChatroomModel(
              id: "fanelifcacnxawodqenacqxo",
              doctorID: "3",
              patientID: "5",
              doctorName: "Sulivan Angel",
              patientName: "Ujjwal Jindal",
              createdAt: DateTime.now().toIso8601String(),
              lastMessage: "Doctor, i need help regarding my old issue",
              doctorProfilePicURL:
                  "https://source.unsplash.com/random/300x300/?q=doctor",
              patientProfilePicURL:
                  "https://source.unsplash.com/random/300x300/?q=patient")
        ];
      }),
      // future: getChatsList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: ChatsListTile(
                snapshot.data![index],
              ),
            ),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
