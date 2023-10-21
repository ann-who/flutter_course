import 'package:flutter/material.dart';

import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:simple_state_management/presentation_layer/utils/app_strings.dart';

class EmptyPage extends StatelessWidget {
  final String subtitle;

  const EmptyPage({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width,
      height: ScreenSize.height * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(AppString.emptyPage, style: AppText.header1),
          SizedBox(height: Spacing.medium),
          Text(
            subtitle,
            style: AppText.header2,
          ),
        ],
      ),
    );
  }
}
