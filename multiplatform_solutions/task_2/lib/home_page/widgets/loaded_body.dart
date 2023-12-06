import 'package:flutter/material.dart';

class LoadedBody extends StatelessWidget {
  const LoadedBody({
    super.key,
    required this.title,
    this.corsHeader,
  });

  final String title;
  final String? corsHeader;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
        ],
      ),
    );
  }
}
