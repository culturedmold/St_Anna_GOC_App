import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CalendarWebView extends StatefulWidget {
  const CalendarWebView({super.key});

  @override
  State<CalendarWebView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
    ..loadRequest(Uri.parse('https://stannagocutah.org/?page_id=284'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendar")),
      body: WebViewWidget(controller: _controller),
    );
  }
}