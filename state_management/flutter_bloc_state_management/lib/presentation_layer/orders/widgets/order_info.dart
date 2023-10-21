import 'package:flutter/material.dart';

import 'package:flutter_bloc_state_management/data_layer/models/created_order/created_order_model.dart';

import 'package:flutter_bloc_state_management/presentation_layer/utils/app_colors.dart';
import 'package:flutter_bloc_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:flutter_bloc_state_management/presentation_layer/utils/app_strings.dart';

class OrderInfo extends StatelessWidget {
  final CreatedOrderModel order;

  const OrderInfo({required this.order, super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your order #${order.hashCode} is on its way!'),
            SizedBox(height: Spacing.big),
            SizedBox(
              height: 60,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: order.products.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    order.products[index].imageUrl,
                    height: 50,
                    width: 50,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: Spacing.small,
                ),
              ),
            ),
            const Divider(color: AppColors.primaryPink),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.created,
                  style: AppText.caption,
                ),
                Text(
                  AppString.delivered,
                  style: AppText.caption,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.creationDate,
                  style: AppText.bodyText2,
                ),
                const Icon(
                  Icons.delivery_dining,
                  color: AppColors.primaryPink,
                ),
                Text(
                  order.deliveryDate,
                  style: AppText.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
