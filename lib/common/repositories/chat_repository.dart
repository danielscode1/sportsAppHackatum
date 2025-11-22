import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chat_message_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatMessageModel>> getChatMessages(String eventId) {
    return _firestore
        .collection('events')
        .doc(eventId)
        .collection('chat')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatMessageModel.fromFirestore(doc))
            .toList());
  }

  Future<void> sendMessage({
    required String eventId,
    required String senderId,
    required String content,
  }) async {
    await _firestore
        .collection('events')
        .doc(eventId)
        .collection('chat')
        .add({
      'senderId': senderId,
      'content': content,
      'timestamp': Timestamp.now(),
    });
  }

  Future<ChatMessageModel?> getLastMessage(String eventId) async {
    final snapshot = await _firestore
        .collection('events')
        .doc(eventId)
        .collection('chat')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return ChatMessageModel.fromFirestore(snapshot.docs.first);
    }
    return null;
  }
}

