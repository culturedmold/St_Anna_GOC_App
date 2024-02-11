import '../model/pastoral_message.dart';
import '../utils/firebase_access/firestore_access.dart';

class PastoralMessagesViewController {
  List<PastoralMessage> pastoralMessagesList = [];

  // Future<List<PastoralMessage>>
  Future<List<PastoralMessage>> fetchPastoralMessages() async {

    try {
      // Get data from firebase and update temp list
      await FireStoreAccess.db.collection("PastoralMessages").get().then((
          event) {
        for (var doc in event.docs) {
          var title = doc["messageTitle"];
          var date = DateTime.parse(doc["messageDate"].toDate().toString());
          var body = doc["messageBody"];

          var pastoralMessage = PastoralMessage(title, date, body);
          pastoralMessagesList.add(pastoralMessage);
        }
      });

      // Sort by date - newest at the front of the list
      pastoralMessagesList.sort((a, b) =>
          b.messageDate.compareTo(a.messageDate));

    } catch (exception){
      print(exception);
    }

    return pastoralMessagesList;
  }
}