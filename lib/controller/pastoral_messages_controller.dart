import '../model/pastoral_message.dart';
import '../utils/firebase_access/firestore_access.dart';

class PastoralMessagesViewController {
  late List<PastoralMessage> _pastoralMessagesList;

  List<PastoralMessage> get pastoralMessagesList => _pastoralMessagesList;

  // Future<List<PastoralMessage>>
  Future<List<PastoralMessage>> fetchPastoralMessages() async {

    List<PastoralMessage> temp = [];

      // Get data from firebase and update temp list
      await FireStoreAccess.db.collection("PastoralMessages").get().then((
          event) {
        for (var doc in event.docs) {
          var title = doc["messageTitle"];
          var date = DateTime.parse(doc["messageDate"].toDate().toString());
          var body = doc["messageBody"];

          var pastoralMessage = PastoralMessage(title, date, body);
          temp.add(pastoralMessage);
        }
      });

      _pastoralMessagesList = temp;
      _pastoralMessagesList.sort((a, b) =>
          b.messageDate.compareTo(a.messageDate));

    return pastoralMessagesList;
  }
}