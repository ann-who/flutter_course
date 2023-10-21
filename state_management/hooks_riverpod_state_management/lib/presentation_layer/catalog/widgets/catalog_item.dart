import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_state_management/business_logic_layer/notifiers/cart/cart_notifier.dart';

import 'package:hooks_riverpod_state_management/data_layer/models/product_model/product_model.dart';

import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_colors.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_icons.dart';

class CatalogItemCard extends HookConsumerWidget {
  final ProductModel product;

  const CatalogItemCard({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenSize().init(context);

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              product.imageUrl,
              width: ScreenSize.width / 2 - 40,
              height: ScreenSize.height / 6,
              fit: BoxFit.contain,
            ),
            SizedBox(height: Spacing.small),
            Text(
              product.title,
              style: AppText.bodyText1,
              textAlign: TextAlign.center,
            ),
            Text(
              product.brand,
              style: AppText.caption,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Spacing.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${product.price} \$'),
                HookConsumer(
                  builder: (context, ref, _) {
                    var cartProvider = ref.read(cartNotifierProvider.notifier);
                    var cartState = ref.watch(cartNotifierProvider);

                    var productAlreadyInCart = cartState.ordersInCart
                        .where((element) => element.product == product)
                        .firstOrNull;

                    return InkWell(
                      onTap: () => cartProvider.add(product),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        clipBehavior: Clip.none,
                        children: [
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: AppIcon(
                                path: AppIconPath.cartIcon,
                                color: AppColors.primaryPink,
                              ),
                            ),
                          ),
                          if (productAlreadyInCart != null)
                            Positioned(
                              top: -5,
                              right: -5,
                              child: SizedBox(
                                height: Spacing.medium,
                                width: Spacing.medium,
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryPink,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      productAlreadyInCart.count.toString(),
                                      style: AppText.caption.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
