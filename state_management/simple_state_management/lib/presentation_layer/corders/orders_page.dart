import 'package:flutter/material.dart';

import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:simple_state_management/presentation_layer/utils/app_icons.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return const PageDecoration(
      child: EmptyOrdersList(),
    );
  }
}

class EmptyOrdersList extends StatelessWidget {
  const EmptyOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width,
      height: ScreenSize.height * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'It\'s empty here :(',
            style: AppText.header1,
          ),
          SizedBox(height: Spacing.medium),
          const Text(
            'Place your first order',
            style: AppText.header2,
          ),
        ],
      ),
    );
  }
}
