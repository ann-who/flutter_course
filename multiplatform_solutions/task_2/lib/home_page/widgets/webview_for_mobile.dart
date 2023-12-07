import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webView(String url) => WebViewForMobile(url: url);

class WebViewForMobile extends StatefulWidget {
  final String url;

  const WebViewForMobile({
    super.key,
    required this.url,
  });

  @override
  State<WebViewForMobile> createState() => _WebViewForMobileState();
}

class _WebViewForMobileState extends State<WebViewForMobile> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            LinearProgressIndicator(
              value: progress.toDouble(),
            );
          },
          onWebResourceError: (WebResourceError error) {
            const Text(
              'Something went wrong. Please try again or paste another URL',
            );
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
