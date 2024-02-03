import '../firebase_access/firestore_access.dart';
import '../model/pastoral_message.dart';

class PastoralMessagesViewController {
  late List<PastoralMessage> pastoralMessagesList = [];

  Future<List<PastoralMessage>> fetchPastoralMessages() async {
    if (pastoralMessagesList.isNotEmpty) { // Set the list to empty if it's not already, so we can ensure fresh data from the API
      pastoralMessagesList = [];
    }

    await FireStoreAccess.db.collection("PastoralMessages").get().then((event) {
      for (var doc in event.docs) {
        var title = doc["messageTitle"];
        var date = DateTime.parse(doc["messageDate"].toDate().toString());
        var body = doc["messageBody"];

        var pastoralMessage = PastoralMessage(title, date, body);
        pastoralMessagesList.add(pastoralMessage);
      }
    });
    pastoralMessagesList.sort((a, b) => b.messageDate.compareTo(a.messageDate));
    return pastoralMessagesList;
  }
}