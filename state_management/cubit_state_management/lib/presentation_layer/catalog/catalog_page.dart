import 'package:flutter/material.dart';

import 'package:cubit_state_management/business_logic_layer/cart_cubit/cart.dart';
import 'package:cubit_state_management/business_logic_layer/catalog_cubit/catalog.dart';
import 'package:cubit_state_management/business_logic_layer/search_cubit/search.dart';

import 'package:cubit_state_management/presentation_layer/catalog/category_page.dart';
import 'package:cubit_state_management/presentation_layer/catalog/widgets/catalog_item.dart';
import 'package:cubit_state_management/presentation_layer/catalog/widgets/category_widget.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_colors.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_icons.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_strings.dart';

class CatalogPage extends StatelessWidget {
  final CatalogCubit catalogCubit;
  final SearchBloc searchCubit;
  final CartCubit cartCubit;

  const CatalogPage({
    required this.catalogCubit,
    required this.searchCubit,
    required this.cartCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return PageDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductSearch(
            searchCubit: searchCubit,
            cartCubit: cartCubit,
          ),
          SizedBox(height: Spacing.medium),
          Text(AppString.ourProducts.toUpperCase()),
          SizedBox(height: Spacing.medium),
          StreamBuilder<CatalogState>(
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
                } else if (snapshot.data!.categories.isNotEmpty) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: snapshot.data!.categories.length,
                    itemBuilder: (context, index) {
                      var category = snapshot.data!.categories[index];

                      return InkWell(
                        onTap: () {
                          catalogCubit.loadCategory(category);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CategoryPage(
                                categoryName: category,
                                catalogCubit: catalogCubit,
                                cartCubit: cartCubit,
                              ),
                            ),
                          );
                        },
                        child: CategoryWidget(title: category),
                      );
                    },
                  );
                }
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class ProductSearch extends StatelessWidget {
  final SearchBloc searchCubit;
  final CartCubit cartCubit;

  const ProductSearch({
    required this.searchCubit,
    required this.cartCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: searchCubit.searchController,
          onChanged: (value) => searchCubit.findProducts(value),
          cursorColor: AppColors.secondaryPink,
          decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(
              maxHeight: Spacing.big,
              maxWidth: Spacing.big,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                right: Spacing.small,
                left: Spacing.small,
              ),
              child: const AppIcon(
                path: AppIconPath.searchIcon,
                color: AppColors.secondaryPink,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.secondaryPink,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.secondaryPink,
              ),
            ),
            hintText: AppString.search,
          ),
        ),
        SizedBox(height: Spacing.medium),
        StreamBuilder<SearchState>(
          stream: searchCubit.state,
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
              } else if (snapshot.data!.foundedProducts.isNotEmpty &&
                  searchCubit.searchController.value.text.isNotEmpty) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: snapshot.data!.foundedProducts.length,
                  itemBuilder: (context, index) {
                    var product = snapshot.data!.foundedProducts[index];

                    return CatalogItemCard(
                      product: product,
                      cartCubit: cartCubit,
                    );
                  },
                );
              } else if (snapshot.data!.foundedProducts.isEmpty &&
                  searchCubit.searchController.value.text.isNotEmpty) {
                return const Text(
                  AppString.noSearchResult,
                  style: AppText.bodyText2,
                );
              }
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
