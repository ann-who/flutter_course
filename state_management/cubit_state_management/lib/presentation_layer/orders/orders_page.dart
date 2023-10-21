import 'package:flutter/material.dart';

import 'package:cubit_state_management/business_logic_layer/order_cubit/order.dart';

import 'package:cubit_state_management/presentation_layer/orders/widgets/order_info.dart';

import 'package:cubit_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_strings.dart';

class OrdersPage extends StatelessWidget {
  final OrderCubit orderCubit;

  const OrdersPage({required this.orderCubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return PageDecoration(
      child: StreamBuilder<OrderState>(
        stream: orderCubit.state,
        initialData: orderCubit.currentState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.orders.isNotEmpty) {
              return SizedBox(
                height: ScreenSize.height * 0.9,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.orders.length,
                  itemBuilder: (context, index) => OrderInfo(
                    order: snapshot.data!.orders[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: Spacing.medium,
                  ),
                ),
              );
            }
          }

          return const EmptyPage(subtitle: AppString.placeOrder);
        },
      ),
    );
  }
}
