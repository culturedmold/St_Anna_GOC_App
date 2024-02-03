
import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/view/pastoral_messages/pastoral_message_detail.dart';

import '../../model/pastoral_message.dart';

class PastoralMessageCard extends StatelessWidget {
  final PastoralMessage pastoralMessage;

  const PastoralMessageCard({super.key, required this.pastoralMessage});

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
                    Text(pastoralMessage.messageTitle, textAlign: TextAlign.start, style: const TextStyle(fontSize: 20), overflow: TextOverflow.fade),
                    Text("Date: ${pastoralMessage.getDateString()}", textAlign: TextAlign.start, overflow: TextOverflow.ellipsis)
                  ],
                ),
              ),
            ),

            // const Spacer(),
            Container(
                margin: const EdgeInsets.all(8.0),
                child: FilledButton (
                    onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PastoralMessageDetailView(pastoralMessage: pastoralMessage))),
                    child: const Icon(Icons.read_more))
            )
          ],
        ),
      ),
    );
  }
}