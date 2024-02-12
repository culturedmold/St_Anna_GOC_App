import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/view/bulletin/bulletins_view.dart';
import 'package:st_anna_goc_app/view/pastoral_messages/pastoral_messages_view.dart';
import 'package:st_anna_goc_app/view/web_view_components/web_view.dart';
import '../../main_appbar.dart';
import 'home_card.dart';

class HomeView extends StatelessWidget {
  final String title = "Home";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: title),
      body: Center(
        child: ListView (
          children: [
            HomeCard(title: "Pastoral Messages", subTitle: DateTime.now().toString(), childView: const PastoralMessagesView(title: "Pastoral Messages",)),
            HomeCard(title: "Bulletins", subTitle: DateTime.now().toString(), childView: const BulletinsView(title: "Bulletins")),
            HomeCard(title: "Calendar", subTitle: DateTime.now().toString(), childView: const WebView(title: "Calendar", destinationUrl: "https://stannagocutah.org/?page_id=284"))
          ],
        ),
      ),
    );
  }
}
