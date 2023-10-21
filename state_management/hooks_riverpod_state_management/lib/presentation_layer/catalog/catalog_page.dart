import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_state_management/business_logic_layer/notifiers/catalog/catalog_notifier.dart';
import 'package:hooks_riverpod_state_management/business_logic_layer/notifiers/search/search_notifier.dart';

import 'package:hooks_riverpod_state_management/presentation_layer/catalog/category_page.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/catalog/widgets/catalog_item.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/catalog/widgets/category_widget.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_colors.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_icons.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_strings.dart';

class CatalogPage extends HookConsumerWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenSize().init(context);

    return PageDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductSearch(),
          SizedBox(height: Spacing.medium),
          Text(AppString.ourProducts.toUpperCase()),
          SizedBox(height: Spacing.medium),
          HookConsumer(
            builder: (context, ref, _) {
              final catalogState = ref.watch(catalogNotifierProvider);
              final catalogProvider =
                  ref.read(catalogNotifierProvider.notifier);

              return catalogState.isLoading
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
                      itemCount: catalogState.categories.length,
                      itemBuilder: (context, index) {
                        var category = catalogState.categories[index];

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

class ProductSearch extends HookConsumerWidget {
  const ProductSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SearchTextFieldWidget(),
        SizedBox(height: Spacing.medium),
        HookConsumer(
          builder: (context, ref, _) {
            final searchState = ref.watch(searchNotifierProvider);
            final searchProvider = ref.read(searchNotifierProvider.notifier);

            if (searchState.isLoading) {
              return SizedBox(
                height: ScreenSize.height * 0.8,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryPink,
                  ),
                ),
              );
            } else if (searchState.foundedProducts.isNotEmpty &&
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
                itemCount: searchState.foundedProducts.length,
                itemBuilder: (context, index) {
                  var product = searchState.foundedProducts[index];

                  return CatalogItemCard(product: product);
                },
              );
            } else if (searchState.foundedProducts.isEmpty &&
                searchProvider.searchController.value.text.isNotEmpty) {
              return const Text(
                AppString.noSearchResult,
                style: AppText.bodyText2,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, _) {
        final searchProvider = ref.read(searchNotifierProvider.notifier);

        return TextFormField(
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
        );
      },
    );
  }
}
