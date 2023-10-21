import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_state_management/business_logic_layer/catalog_notifier.dart';
import 'package:simple_state_management/business_logic_layer/search_notifier.dart';

import 'package:simple_state_management/presentation_layer/catalog/category_page.dart';
import 'package:simple_state_management/presentation_layer/catalog/widgets/catalog_item.dart';
import 'package:simple_state_management/presentation_layer/catalog/widgets/category_widget.dart';
import 'package:simple_state_management/presentation_layer/utils/app_colors.dart';
import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:simple_state_management/presentation_layer/utils/app_icons.dart';
import 'package:simple_state_management/presentation_layer/utils/app_strings.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return PageDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductSearch(),
          SizedBox(height: Spacing.medium),
          Text(AppString.ourProducts.toUpperCase()),
          SizedBox(height: Spacing.medium),
          Consumer(
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
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: catalogProvider.categories.length,
                      itemBuilder: (context, index) {
                        var category = catalogProvider.categories[index];

                        return InkWell(
                          onTap: () {
                            catalogProvider.getCategoryProducts(category);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CategoryPage(
                                  categoryName: category,
                                ),
                              ),
                            );
                          },
                          child: CategoryWidget(title: category),
                        );
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}

class ProductSearch extends StatelessWidget {
  const ProductSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var searchProvider = context.read<SearchNotifier>();

    return Column(
      children: [
        TextFormField(
          controller: searchProvider.searchController,
          onChanged: (value) => searchProvider.searchProduct(value),
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
        Consumer(
          builder: (context, SearchNotifier searchProvider, child) {
            if (searchProvider.isLoading) {
              return SizedBox(
                height: ScreenSize.height * 0.8,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryPink,
                  ),
                ),
              );
            } else if (searchProvider.foundedProducts.isNotEmpty &&
                searchProvider.searchController.value.text.isNotEmpty) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: searchProvider.foundedProducts.length,
                itemBuilder: (context, index) {
                  var product = searchProvider.foundedProducts[index];

                  return CatalogItemCard(product: product);
                },
              );
            } else if (searchProvider.foundedProducts.isEmpty &&
                searchProvider.searchController.value.text.isNotEmpty) {
              return const Text(
                AppString.noSearchResult,
                style: AppText.bodyText2,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
