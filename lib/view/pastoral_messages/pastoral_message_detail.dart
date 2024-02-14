import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/model/pastoral_message.dart';

class PastoralMessageDetailView extends StatelessWidget {
  final PastoralMessage pastoralMessage;

  const PastoralMessageDetailView({required this.pastoralMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Pastoral Message"),
        // elevation: 8,
        // shadowColor: Theme.of(context).primaryColor,
      ),
    body: Center(
      // child: Padding(
      // padding: const EdgeInsets.all(8.0),
      child: ListView (
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(pastoralMessage.messageTitle, style: const TextStyle(fontSize: 24))
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Date: ${pastoralMessage.getDateString()}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
        child: Text(pastoralMessage.messageBody.replaceAll('\\n', '\n'))
        ),
    ],
    ),
    ),
    // ),
    );
  }

}