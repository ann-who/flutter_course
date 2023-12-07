// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

Widget webView(String url) => WebViewForWeb(url: url);

class WebViewForWeb extends StatelessWidget {
  final String url;

  const WebViewForWeb({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    var viewType = const Uuid().v4();
    PlatformViewRegistry().registerViewFactory(
      viewType,
      (viewType) => IFrameElement()..src = url,
    );

    return HtmlElementView(viewType: viewType);
  }
}
