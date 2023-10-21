import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_state_management/business_logic_layer/cart_notifier.dart';
import 'package:simple_state_management/business_logic_layer/order_notifier.dart';
import 'package:simple_state_management/presentation_layer/cart/widgets/order_item.dart';

import 'package:simple_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:simple_state_management/presentation_layer/utils/app_colors.dart';
import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:simple_state_management/presentation_layer/utils/app_strings.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    var orderProvider = context.read<OrderNotifier>();

    return PageDecoration(
      child: Consumer(
        builder: (context, CartNotifier cartProvider, child) {
          return cartProvider.ordersInCart.isEmpty
              ? const EmptyPage(subtitle: AppString.addGoods)
              : Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartProvider.ordersInCart.length,
                      itemBuilder: (context, index) {
                        var order = cartProvider.ordersInCart[index];

                        return OrderItem(order: order);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: Spacing.small,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: Spacing.medium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(AppString.totalAmount),
                            Text('${cartProvider.totalPrice} \$'),
                          ],
                        ),
                        SizedBox(height: Spacing.big),
                        InkWell(
                          onTap: () {
                            orderProvider
                                .placeNewOrder(cartProvider.products());
                            cartProvider.clearCart();
                          },
                          child: Container(
                            width: ScreenSize.width,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryPink,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                AppString.createOrder,
                                style: AppText.header1.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
