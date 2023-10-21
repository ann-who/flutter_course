import 'package:flutter/material.dart';

import 'package:bloc_state_management/business_logic_layer/catalog_bloc/catalog.dart';
import 'package:bloc_state_management/business_logic_layer/cart_bloc/cart.dart';

import 'package:bloc_state_management/presentation_layer/catalog/widgets/catalog_item.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_colors.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_decorations.dart';

class CategoryPage extends StatelessWidget {
  final CatalogBloc catalogBloc;
  final CartBloc cartBloc;
  final String categoryName;

  const CategoryPage({
    required this.catalogBloc,
    required this.cartBloc,
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
          stream: catalogBloc.state,
          initialData: catalogBloc.currentState,
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
                      cartBloc: cartBloc,
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
