import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_state_management/business_logic_layer/notifiers/cart/cart_notifier.dart';
import 'package:riverpod_state_management/business_logic_layer/notifiers/order/order_notifier.dart';
import 'package:riverpod_state_management/presentation_layer/cart/widgets/order_item.dart';

import 'package:riverpod_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:riverpod_state_management/presentation_layer/utils/app_colors.dart';
import 'package:riverpod_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:riverpod_state_management/presentation_layer/utils/app_strings.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenSize().init(context);
    var cartProvider = ref.watch(cartNotifierProvider.notifier);
    var cartState = ref.watch(cartNotifierProvider);
    var orderProvider = ref.watch(orderNotifierProvider.notifier);

    return PageDecoration(
      child: cartState.ordersInCart.isEmpty
          ? const EmptyPage(subtitle: AppString.addGoods)
          : Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartState.ordersInCart.length,
                  itemBuilder: (context, index) {
                    var order = cartState.ordersInCart[index];

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
                        Text('${cartState.totalPrice} \$'),
                      ],
                    ),
                    SizedBox(height: Spacing.big),
                    InkWell(
                      onTap: () {
                        orderProvider.placeNewOrder(
                          cartState.currentProducts.toList(),
                        );
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
            ),
    );
  }
}
