import '../model/bulletin.dart';
import '../utils/firebase_access/firestore_access.dart';

class BulletinViewController {
  late List<Bulletin> _bulletinsList;

  List<Bulletin> get bulletinsList => _bulletinsList;

  Future<List<Bulletin>> fetchBulletins() async {
    List<Bulletin> temp = [];

      await FireStoreAccess.db.collection("BulletinLinks").get().then((event) {
        for (var doc in event.docs) {
          var bulletinUrl = doc["URL"];
          var bulletinDate = DateTime.parse(
              doc["bulletinDate"].toDate().toString());

          var bulletin = Bulletin(bulletinUrl, bulletinDate);
          temp.add(bulletin);
        }
      });

    _bulletinsList = temp;
    _bulletinsList.sort((a, b) => b.bulletinDate.compareTo(a.bulletinDate));

    return bulletinsList;
  }
}