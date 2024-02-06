import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebNavigationControls extends StatelessWidget {
  const WebNavigationControls({required WebViewController controller, super.key}) : _controller = controller;

  final WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            if (await _controller.canGoBack()) {
              await _controller.goBack();
            } else {
              messenger.showSnackBar(
                const SnackBar(content: Text('No back history')),
              );
              return;
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            if (await _controller.canGoForward()) {
              await _controller.goForward();
            } else {
              messenger.showSnackBar(
                const SnackBar(content: Text('No forward history')),
              );
              return;
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            _controller.reload();
          },
        ),
      ],
    );
  }
}