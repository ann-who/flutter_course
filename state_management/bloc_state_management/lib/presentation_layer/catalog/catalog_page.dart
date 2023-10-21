import 'package:flutter/material.dart';

import 'package:bloc_state_management/business_logic_layer/cart_bloc/cart.dart';
import 'package:bloc_state_management/business_logic_layer/catalog_bloc/catalog.dart';
import 'package:bloc_state_management/business_logic_layer/search_bloc/search.dart';

import 'package:bloc_state_management/presentation_layer/catalog/category_page.dart';
import 'package:bloc_state_management/presentation_layer/catalog/widgets/catalog_item.dart';
import 'package:bloc_state_management/presentation_layer/catalog/widgets/category_widget.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_colors.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_icons.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_strings.dart';

class CatalogPage extends StatelessWidget {
  final CatalogBloc catalogBloc;
  final SearchBloc searchBloc;
  final CartBloc cartBloc;

  const CatalogPage({
    required this.catalogBloc,
    required this.searchBloc,
    required this.cartBloc,
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
            searchBloc: searchBloc,
            cartBloc: cartBloc,
          ),
          SizedBox(height: Spacing.medium),
          Text(AppString.ourProducts.toUpperCase()),
          SizedBox(height: Spacing.medium),
          StreamBuilder<CatalogState>(
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
                          catalogBloc.event
                              .add(CategoryLoaded(category: category));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CategoryPage(
                                categoryName: category,
                                catalogBloc: catalogBloc,
                                cartBloc: cartBloc,
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
  final SearchBloc searchBloc;
  final CartBloc cartBloc;

  const ProductSearch({
    required this.searchBloc,
    required this.cartBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: searchBloc.searchController,
          onChanged: (value) => searchBloc.event.add(
            ProductsFounded(name: value),
          ),
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
          stream: searchBloc.state,
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
                  searchBloc.searchController.value.text.isNotEmpty) {
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
                      cartBloc: cartBloc,
                    );
                  },
                );
              } else if (snapshot.data!.foundedProducts.isEmpty &&
                  searchBloc.searchController.value.text.isNotEmpty) {
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
