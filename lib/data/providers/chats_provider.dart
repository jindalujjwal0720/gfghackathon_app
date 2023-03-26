import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gfghackathon_app/data/constants/user.dart';
import 'package:gfghackathon_app/data/mock/mock_data.dart';
import 'package:gfghackathon_app/data/models/chatroom_model.dart';
import 'package:gfghackathon_app/data/models/message_model.dart';

final db = FirebaseFirestore.instance;

Future<List<ChatroomModel>> getChatsList() async {
  final snapshot = await db
      .collection("chatrooms")
      .where("patientID", isEqualTo: int.parse(userConstants.user.id))
      .get();
  final chatsList = snapshot.docs
      .map((e) => ChatroomModel.fromMap({"id": e.id, ...e.data()}))
      .toList();
  return chatsList;
}

Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
    ChatroomModel chatroom) {
  final snapshots = db
      .collection("chatrooms/${chatroom.id}/messages")
      .orderBy("timestamp", descending: true)
      .limit(15)
      .snapshots();
  return snapshots;
}

Future<void> sendMessage(ChatroomModel chatroom, String message) async {
  db.collection("chatrooms/${chatroom.id}/messages").add({
    "sentByID": userConstants.user.id,
    "message": message,
    "timestamp": DateTime.now().millisecondsSinceEpoch
  });
}
