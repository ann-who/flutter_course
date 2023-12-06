import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:task_2/home_page/widgets/bottom_load_bar.dart';
import 'package:task_2/home_page/widgets/loaded_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    _getUrlInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder(
            future: _getUrlInfo(),
            builder: (context, snapshot) {
              bool isWaiting =
                  snapshot.connectionState == ConnectionState.waiting;
              bool isError = snapshot.connectionState == ConnectionState.done &&
                  (snapshot.hasError || snapshot.data == null) &&
                  urlController.text.isNotEmpty;
              bool isLoaded =
                  snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      urlController.text.isNotEmpty;

              if (isWaiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (isError) {
                return const Center(
                  child: Text(
                    'Something went wrong. Please try again or paste another URL',
                  ),
                );
              } else if (isLoaded) {
                var htmlBody = snapshot.data!.body;
                var parsedHtml = parse(htmlBody);
                var title =
                    parsedHtml.getElementsByTagName('title').first.innerHtml;
                var corsHeader =
                    snapshot.data!.headers['access-control-allow-origin'];

                return LoadedBody(
                  title: title,
                  corsHeader: corsHeader,
                );
              } else {
                return const Center(
                  child: Text('Content will appear here'),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomLoadBar(
        onUrlChanged: (value) => _setNewUrl(value),
        onLoadTap: () => _getUrlInfo(),
      ),
    );
  }

  void _setNewUrl(String value) {
    urlController.text = value;
  }

  Future<http.Response?> _getUrlInfo() async {
    var uri = Uri.parse(urlController.text);
    Future<http.Response>? result;
    if (uri.isAbsolute) {
      setState(() {
        result = http.get(uri);
      });
    } else {
      setState(() {
        result = null;
      });
    }
    return result;
  }
}
