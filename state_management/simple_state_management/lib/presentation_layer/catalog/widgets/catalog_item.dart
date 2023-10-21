import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/business_logic_layer/cart_notifier.dart';

import 'package:simple_state_management/data_layer/models/product_model/product_model.dart';

import 'package:simple_state_management/presentation_layer/utils/app_colors.dart';
import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:simple_state_management/presentation_layer/utils/app_icons.dart';

class CatalogItemCard extends StatelessWidget {
  final ProductModel product;

  const CatalogItemCard({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Consumer(
                  builder: (context, CartNotifier cartProvider, child) {
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
                          if (cartProvider.ordersInCart
                              .where((element) => element.product == product)
                              .isNotEmpty)
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
                                      cartProvider.productCount(product),
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
