import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/view/web_view_components/web_navigation_controls.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String title;
  final String destinationUrl;
  const WebView({super.key, required this.title, required this.destinationUrl});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse(widget.destinationUrl))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        WebNavigationControls(controller: _controller),
      ],),
      body: WebViewWidget(controller: _controller),
    );
  }
}