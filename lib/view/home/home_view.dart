import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/view/bulletin/bulletins_view.dart';
import 'package:st_anna_goc_app/view/calendar/calendar_view.dart';
import 'package:st_anna_goc_app/view/pastoral_messages/pastoral_messages_view.dart';
import 'home_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  final String title;

  const HomeView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                var uri = Uri.parse('tel:18013582148');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  throw 'Could not launch $uri';
                }
              },
              icon: const Icon(Icons.phone))
        ],
        title: Text(title),
         // elevation: 200,
         scrolledUnderElevation: 16,
         //surfaceTintColor: Theme.of(context).primaryColorLight,
         shadowColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        // child: ListView.builder(
        //     itemCount: _controller.homeTiles.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return HomeTileWidget(
        //           title: _controller.homeTiles[index].title,
        //           subTitle: _controller.homeTiles[index].subTitle);
        //     }),
        child: ListView (
          children: [
            HomeCard(title: "Pastoral Messages", subTitle: DateTime.now().toString(), childView: const PastoralMessagesView(title: "Pastoral Messages",)),
            HomeCard(title: "Bulletins", subTitle: DateTime.now().toString(), childView: const BulletinsView(title: "Bulletins")),
            HomeCard(title: "Calendar", subTitle: DateTime.now().toString(), childView: const CalendarWebView())
          ],
        ),
      ),
    );
  }
}
