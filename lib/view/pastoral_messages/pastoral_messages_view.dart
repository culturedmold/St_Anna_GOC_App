import 'package:flutter/material.dart';
import '../../controller/pastoral_messages_controller.dart';
import 'pastoral_message_card.dart';

class PastoralMessagesView extends StatefulWidget {
  final String title;

  const PastoralMessagesView({super.key, required this.title});

  @override
  State<PastoralMessagesView> createState() => _PastoralMessagesViewState();
}

class _PastoralMessagesViewState extends State<PastoralMessagesView> {
  late final PastoralMessagesViewController _controller = PastoralMessagesViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        scrolledUnderElevation: 16,
        // surfaceTintColor: Theme.of(context).primaryColorLight,
        shadowColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: _controller.fetchPastoralMessages(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center (
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PastoralMessageCard(
                          pastoralMessage: snapshot.data[index]);
                    }
                ),
                onRefresh: () async {
                  setState(() {});
                });
          }
        }
      )
    );
  }
}
