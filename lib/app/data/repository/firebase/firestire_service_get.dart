import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceGet {
 Future<DocumentSnapshot?> getAPI() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('API')
          .doc('uUKOwRAIHWvAW6yRUWdA')
          .get();

      return snapshot;
    } catch (e) {
      print('Error getting document: $e');
      return null;
    }
  }
}
