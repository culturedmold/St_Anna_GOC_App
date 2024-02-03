import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StewardshipWebView extends StatefulWidget {
  const StewardshipWebView({super.key});

  @override
  State<StewardshipWebView> createState() => _StewardshipWebViewState();
}

class _StewardshipWebViewState extends State<StewardshipWebView> {
  late final WebViewController _controller;
  final String stewardshipUrl =
      "https://www.eservicepayments.com/cgi-bin/Vanco_ver3.vps?appver3=wWsk24ZWJSTZKsGd1RMKlg0BDvsSG3VIWQCPJNNxD8upkiY7JlDavDsozUE7KG0nFx2NSo8LdUKGuGuF396vbReVdS7jwpFaybhGQTnmuj6XHubq5Z7ap5JVmPErc4ZeYHCKCZhESjGNQmZ5B-6dx6hxWhlY3PmHrafyNj6wdeI=&ver=3";
  final String appBarTitle = "Stewardship";

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()..loadRequest(Uri.parse(stewardshipUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: WebViewWidget(controller: _controller),
    );
  }
}