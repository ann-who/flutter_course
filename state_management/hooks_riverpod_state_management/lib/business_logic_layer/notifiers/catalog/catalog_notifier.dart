import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hooks_riverpod_state_management/business_logic_layer/notifiers/catalog/catalog_state.dart';
import 'package:hooks_riverpod_state_management/data_layer/data_source/products_data_source.dart';

import 'package:hooks_riverpod_state_management/data_layer/models/product_model/product_model.dart';
import 'package:hooks_riverpod_state_management/data_layer/repository/products_repository.dart';
import 'package:hooks_riverpod_state_management/data_layer/repository/products_repository_implementation.dart';

final catalogNotifierProvider =
    StateNotifierProvider<CatalogNotifier, CatalogState>(
  (ref) {
    return CatalogNotifier(
      productsRepository: ProductsRepositoryImplementation(
        productsDataSource: ProductsDataSource(),
      ),
    );
  },
);

class CatalogNotifier extends StateNotifier<CatalogState> {
  final ProductsRepository productsRepository;

  CatalogNotifier({required this.productsRepository})
      : super(const CatalogState()) {
    getCategories();
  }

  // Get all categories
  getCategories() async {
    state = state.copyWith(isLoading: true);
    List<String> response = await productsRepository.getCategories();

    state = state.copyWith(isLoading: false, categories: response);
  }

  // Get products of a specific category
  getCategoryProducts(String categoryName) async {
    state = state.copyWith(isLoading: true);
    List<ProductModel> response =
        await productsRepository.getCategory(categoryName);

    state = state.copyWith(isLoading: false, categoryProducts: response);
  }
}
