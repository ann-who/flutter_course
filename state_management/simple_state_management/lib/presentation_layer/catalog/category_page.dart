import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_state_management/business_logic_layer/catalog_notifier.dart';

import 'package:simple_state_management/presentation_layer/catalog/widgets/catalog_item.dart';
import 'package:simple_state_management/presentation_layer/utils/app_colors.dart';
import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryPink,
        title: Text(categoryName.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer(
          builder: (context, CatalogNotifier catalogProvider, child) {
            return catalogProvider.isLoading
                ? SizedBox(
                    height: ScreenSize.height * 0.8,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryPink,
                      ),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: catalogProvider.categoryProducts.length,
                    itemBuilder: (context, index) {
                      var product = catalogProvider.categoryProducts[index];

                      return CatalogItemCard(product: product);
                    },
                  );
          },
        ),
      ),
    );
  }
}
