import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoadedBody extends StatelessWidget {
  const LoadedBody({
    super.key,
    required this.title,
    this.corsHeader,
    required this.controller,
  });

  final String title;
  final String? corsHeader;
  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.trim(),
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          'CORS header: ${corsHeader ?? 'None'}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: WebViewWidget(controller: controller),
        ),
      ],
    );
  }
}
