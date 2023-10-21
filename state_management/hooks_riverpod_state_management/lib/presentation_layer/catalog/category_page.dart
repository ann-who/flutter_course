import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod_state_management/business_logic_layer/notifiers/catalog/catalog_notifier.dart';

import 'package:hooks_riverpod_state_management/presentation_layer/catalog/widgets/catalog_item.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_colors.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_decorations.dart';

class CategoryPage extends ConsumerWidget {
  final String categoryName;

  const CategoryPage({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenSize().init(context);
    var catalogState = ref.watch(catalogNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryPink,
        title: Text(categoryName.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: catalogState.isLoading
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
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: catalogState.categoryProducts.length,
                itemBuilder: (context, index) {
                  var product = catalogState.categoryProducts[index];

                  return CatalogItemCard(product: product);
                },
              ),
      ),
    );
  }
}
