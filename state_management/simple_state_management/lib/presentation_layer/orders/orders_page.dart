import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/business_logic_layer/order_notifier.dart';
import 'package:simple_state_management/presentation_layer/orders/widgets/order_info.dart';

import 'package:simple_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:simple_state_management/presentation_layer/utils/app_strings.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return PageDecoration(
      child: Consumer(
        builder: (context, OrderNotifier orderProvider, child) {
          return orderProvider.orders.isEmpty
              ? const EmptyPage(subtitle: AppString.placeOrder)
              : SizedBox(
                  height: ScreenSize.height * 0.9,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: orderProvider.orders.length,
                    itemBuilder: (context, index) => OrderInfo(
                      order: orderProvider.orders[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: Spacing.medium,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
