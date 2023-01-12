import 'package:flutter/material.dart';

import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:simple_state_management/presentation_layer/utils/app_icons.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return const PageDecoration(
      child: EmptyCart(),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
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
            'Please add goods to your cart',
            style: AppText.header2,
          ),
        ],
      ),
    );
  }
}
