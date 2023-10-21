import 'package:flutter/material.dart';

import 'package:bloc_state_management/business_logic_layer/cart_bloc/cart.dart';
import 'package:bloc_state_management/business_logic_layer/order_bloc/order.dart';

import 'package:bloc_state_management/presentation_layer/cart/widgets/order_item.dart';

import 'package:bloc_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_colors.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_strings.dart';

class CartPage extends StatelessWidget {
  final CartBloc cartBloc;
  final OrderBloc orderBloc;

  const CartPage({
    required this.cartBloc,
    required this.orderBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return PageDecoration(
      child: StreamBuilder<CartState>(
        stream: cartBloc.state,
        initialData: cartBloc.currentState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.ordersInCart.isNotEmpty) {
              return Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.ordersInCart.length,
                    itemBuilder: (context, index) {
                      var order = snapshot.data!.ordersInCart[index];

                      return OrderItem(cartBloc: cartBloc, order: order);
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
                          Text('${snapshot.data!.totalPrice} \$'),
                        ],
                      ),
                      SizedBox(height: Spacing.big),
                      InkWell(
                        onTap: () {
                          orderBloc.event.add(
                            NewOrderPlaced(
                              products: snapshot.data!.currentProducts.toList(),
                            ),
                          );
                          cartBloc.event.add(CartCleared());
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
            }
          }
          return const EmptyPage(subtitle: AppString.addGoods);
        },
      ),
    );
  }
}
