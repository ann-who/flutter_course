import 'package:flutter/material.dart';
import 'package:task_1/home_page/widgets/app_platform.dart';

class BottomLoadBar extends StatelessWidget {
  final Function(String value) onUrlChanged;
  final VoidCallback onLoadTap;

  const BottomLoadBar({
    super.key,
    required this.onUrlChanged,
    required this.onLoadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 2.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) => onUrlChanged(value),
                    decoration: const InputDecoration(
                      hintText: 'Place your URL here',
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: onLoadTap,
                  child: const Text('Load'),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Application is running on '.toUpperCase(),
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: AppPlatform.platform.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
