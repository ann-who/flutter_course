import 'package:flutter/material.dart';

import 'package:cubit_state_management/business_logic_layer/catalog_cubit/catalog.dart';
import 'package:cubit_state_management/business_logic_layer/cart_cubit/cart.dart';

import 'package:cubit_state_management/presentation_layer/catalog/widgets/catalog_item.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_colors.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_decorations.dart';

class CategoryPage extends StatelessWidget {
  final CatalogCubit catalogCubit;
  final CartCubit cartCubit;
  final String categoryName;

  const CategoryPage({
    required this.catalogCubit,
    required this.cartCubit,
    required this.categoryName,
    super.key,
  });

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
        child: StreamBuilder<CatalogState>(
          stream: catalogCubit.state,
          initialData: catalogCubit.currentState,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isLoading) {
                return SizedBox(
                  height: ScreenSize.height * 0.8,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryPink,
                    ),
                  ),
                );
              } else if (snapshot.data!.categoryProducts.isNotEmpty) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: snapshot.data!.categoryProducts.length,
                  itemBuilder: (context, index) {
                    var product = snapshot.data!.categoryProducts[index];

                    return CatalogItemCard(
                      cartCubit: cartCubit,
                      product: product,
                    );
                  },
                );
              }
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
