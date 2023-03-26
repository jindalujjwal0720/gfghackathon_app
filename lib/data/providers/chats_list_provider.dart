import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gfghackathon_app/data/constants/user.dart';
import 'package:gfghackathon_app/data/models/chatroom_model.dart';

final db = FirebaseFirestore.instance;

Future<List<ChatroomModel>> getChatsList() async {
  final snapshot = await db
      .collection("chatrooms")
      .where("patientID", isEqualTo: int.parse(userConstants.user.id))
      .get();
  final chatsList = snapshot.docs
      .map((e) => ChatroomModel.fromMap({"id": e.id, ...e.data()})).toList();
  return chatsList;
}
