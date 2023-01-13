import 'package:flutter/material.dart';

import 'package:simple_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return const PageDecoration(
      child: EmptyPage(
        subtitle: 'Place your first order',
      ),
    );
  }
}
