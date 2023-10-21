import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_state_management/business_logic_layer/order_bloc/order.dart';

import 'package:flutter_bloc_state_management/presentation_layer/orders/widgets/order_info.dart';

import 'package:flutter_bloc_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:flutter_bloc_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:flutter_bloc_state_management/presentation_layer/utils/app_strings.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return PageDecoration(
      child: BlocBuilder<OrderBloc, OrderState>(
        buildWhen: (previous, current) => previous.orders != current.orders,
        builder: (context, state) {
          return state.orders.isEmpty
              ? const EmptyPage(subtitle: AppString.placeOrder)
              : SizedBox(
                  height: ScreenSize.height * 0.9,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) => OrderInfo(
                      order: state.orders[index],
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
