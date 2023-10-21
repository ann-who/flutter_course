import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_state_management/business_logic_layer/notifiers/order/order_notifier.dart';

import 'package:hooks_riverpod_state_management/presentation_layer/orders/widgets/order_info.dart';

import 'package:hooks_riverpod_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_strings.dart';

class OrdersPage extends HookConsumerWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenSize().init(context);

    return PageDecoration(
      child: HookConsumer(
        builder: (context, ref, _) {
          var orderState = ref.watch(orderNotifierProvider);
          return orderState.orders.isEmpty
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
                );
        },
      ),
    );
  }
}
