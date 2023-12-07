import 'package:flutter/material.dart';

import 'package:task_2/home_page/widgets/mock_webview.dart'
    if (dart.library.html) 'package:task_2/home_page/widgets/webview_for_web.dart'
    if (dart.library.io) 'package:task_2/home_page/widgets/webview_for_others.dart';

class LoadedBody extends StatelessWidget {
  const LoadedBody({
    super.key,
    required this.title,
    this.corsHeader,
    required this.url,
  });

  final String title;
  final String? corsHeader;
  final String url;

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
        Expanded(child: webView(url)),
      ],
    );
  }
}
