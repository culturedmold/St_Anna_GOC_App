import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/main_appbar.dart';
import 'package:st_anna_goc_app/view/web_view_components/web_view.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  final String title = "Donate";

  final String appBarTitle = "Donate";
  final String capitalCampaignUrl =
      "https://www.eservicepayments.com/cgi-bin/Vanco_ver3.vps?appver3=wWsk24ZWJSTZKsGd1RMKlg0BDvsSG3VIWQCPJNNxD8upkiY7JlDavDsozUE7KG0nFx2NSo8LdUKGuGuF396vbcGDOPMlnzRQOAmUavFnrd-XHubq5Z7ap5JVmPErc4ZeYHCKCZhESjGNQmZ5B-6dxz8jBKZ7fzcNnOvEJiLQzQ0=&ver=3";

  final String stewardshipSubtitle =
      "Tap to make an online stewardship payment, altar/benevolence fund contribution, or other donation.";
  final String stewardshipTitle = "Stewardship";
  final String stewardshipUrl =
      "https://www.eservicepayments.com/cgi-bin/Vanco_ver3.vps?appver3=wWsk24ZWJSTZKsGd1RMKlg0BDvsSG3VIWQCPJNNxD8upkiY7JlDavDsozUE7KG0nFx2NSo8LdUKGuGuF396vbReVdS7jwpFaybhGQTnmuj6XHubq5Z7ap5JVmPErc4ZeYHCKCZhESjGNQmZ5B-6dx6hxWhlY3PmHrafyNj6wdeI=&ver=3";

  final String capitalCampaignTitle = "CapitalCampaign";
  final String capitalCampaignSubtitle =
      "Tap to make a donation or payment to the St. Anna Capital Campaign.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "Donate"),
      body: Center(
        child: Column(
          children: [
            DonateTile(title: stewardshipTitle, subtitle: stewardshipSubtitle, destinationWebView: WebView(title: stewardshipTitle, destinationUrl: stewardshipUrl)),
            DonateTile(title: capitalCampaignTitle, subtitle: capitalCampaignSubtitle, destinationWebView: WebView(title: capitalCampaignTitle, destinationUrl: capitalCampaignUrl))
          ],
        ),
      ),
    );
  }
}

class DonateTile extends StatelessWidget {
  const DonateTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.destinationWebView
  });

  final String title;
  final String subtitle;
  final Widget destinationWebView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
      child: Card(
        elevation: 8,
        shadowColor: Theme.of(context).primaryColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => destinationWebView))
          },
          child: ListTile(
            title: Text(title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle),
            trailing: const Icon(Icons.arrow_circle_right),
          ),
        ),
      ),
    );
  }
}
