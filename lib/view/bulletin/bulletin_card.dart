import 'package:flutter/material.dart';
import '../../model/bulletin.dart';

class BulletinCard extends StatelessWidget {
  final Bulletin bulletin;

  const BulletinCard({super.key, required this.bulletin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
      child: Card(
        elevation: 8.0,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Published Date: ${bulletin.getDateString()}", textAlign: TextAlign.start, style: const TextStyle(fontSize: 20), overflow: TextOverflow.fade),
                  ],
                ),
              ),
            ),

            // const Spacer(),
            Container(
                margin: const EdgeInsets.all(8.0),
                child: FilledButton (
                    onPressed: () =>
                        bulletin.openBulletinLink(),
                    child: const Icon(Icons.read_more))
            )
          ],
        ),
      ),
    );
  }
}