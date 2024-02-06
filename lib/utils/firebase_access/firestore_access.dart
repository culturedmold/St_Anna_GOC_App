import 'package:cloud_firestore/cloud_firestore.dart';

final class FireStoreAccess {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  // return messages from firebase
  static void fetchPastoralMessages() async {
    await db.collection("PastoralMessages").get().then((event) {
      for (var doc in event.docs) {
        print(doc.id);
      }
    });
  }
}