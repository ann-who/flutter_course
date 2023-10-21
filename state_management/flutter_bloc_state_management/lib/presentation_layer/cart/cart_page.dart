import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_state_management/business_logic_layer/cart_bloc/cart.dart';
import 'package:flutter_bloc_state_management/business_logic_layer/order_bloc/order.dart';

import 'package:flutter_bloc_state_management/presentation_layer/cart/widgets/order_item.dart';

import 'package:flutter_bloc_state_management/presentation_layer/shared_widgets/empty_page.dart';
import 'package:flutter_bloc_state_management/presentation_layer/utils/app_colors.dart';
import 'package:flutter_bloc_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:flutter_bloc_state_management/presentation_layer/utils/app_strings.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    var orderBloc = context.read<OrderBloc>();
    var cartBloc = context.read<CartBloc>();

    return PageDecoration(
      child: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) =>
            previous.ordersInCart != current.ordersInCart,
        builder: (context, state) {
          return state.ordersInCart.isEmpty
              ? const EmptyPage(subtitle: AppString.addGoods)
              : Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.ordersInCart.length,
                      itemBuilder: (context, index) {
                        var order = state.ordersInCart[index];

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
                            Text('${state.totalPrice} \$'),
                          ],
                        ),
                        SizedBox(height: Spacing.big),
                        InkWell(
                          onTap: () {
                            orderBloc.add(
                              NewOrderPlaced(
                                products: state.currentProducts.toList(),
                              ),
                            );
                            cartBloc.add(CartCleared());
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
