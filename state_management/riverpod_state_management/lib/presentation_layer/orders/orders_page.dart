import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/business_logic_layer/notifiers/order/order_notifier.dart';

import 'package:riverpod_state_management/presentation_layer/orders/widgets/order_info.dart';

import 'package:riverpod_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:riverpod_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:riverpod_state_management/presentation_layer/utils/app_strings.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenSize().init(context);

    var orderState = ref.watch(orderNotifierProvider);

    return PageDecoration(
      child: orderState.orders.isEmpty
          ? const EmptyPage(subtitle: AppString.placeOrder)
          : SizedBox(
              height: ScreenSize.height * 0.9,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: orderState.orders.length,
                itemBuilder: (context, index) => OrderInfo(
                  order: orderState.orders[index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: Spacing.medium,
                ),
              ),
            ),
    );
  }
}
