import 'package:flutter/material.dart';

import 'package:bloc_state_management/business_logic_layer/cart_bloc/cart.dart';

import 'package:bloc_state_management/data_layer/models/order_in_cart/order_in_cart_model.dart';

import 'package:bloc_state_management/presentation_layer/utils/app_colors.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_icons.dart';

class OrderItem extends StatelessWidget {
  final CartBloc cartBloc;
  final OrderInCartModel order;

  const OrderItem({required this.cartBloc, required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.lightGrey.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              order.product.imageUrl,
              height: 100,
              width: 100,
            ),
            SizedBox(width: Spacing.medium),
            SizedBox(
              width: ScreenSize.width / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.product.title,
                    maxLines: 2,
                    style: AppText.bodyText1,
                    overflow: TextOverflow.fade,
                  ),
                  SizedBox(height: Spacing.medium),
                  Text('${order.product.price} \$'),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => cartBloc.event.add(
                ProductDecreased(product: order.product),
              ),
              child: const AppIcon(
                path: AppIconPath.removeIcon,
                color: AppColors.primaryPink,
              ),
            ),
            Text(order.count.toString()),
            InkWell(
              onTap: () => cartBloc.event.add(
                ProductAdded(product: order.product),
              ),
              child: const AppIcon(
                path: AppIconPath.addIcon,
                color: AppColors.primaryPink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
