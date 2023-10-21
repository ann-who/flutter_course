import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_state_management/business_logic_layer/notifiers/search/search_state.dart';

import 'package:riverpod_state_management/data_layer/data_source/products_data_source.dart';
import 'package:riverpod_state_management/data_layer/models/product_model/product_model.dart';
import 'package:riverpod_state_management/data_layer/repository/products_repository.dart';
import 'package:riverpod_state_management/data_layer/repository/products_repository_implementation.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) {
    return SearchNotifier(
      productsRepository: ProductsRepositoryImplementation(
        productsDataSource: ProductsDataSource(),
      ),
    );
  },
);

class SearchNotifier extends StateNotifier<SearchState> {
  final ProductsRepository productsRepository;

  SearchNotifier({required this.productsRepository})
      : super(const SearchState());

  TextEditingController searchController = TextEditingController();

  searchProduct(String name) async {
    state = state.copyWith(isLoading: true);
    List<ProductModel> response = await productsRepository.searchProduct(name);

    state = state.copyWith(isLoading: false, foundedProducts: response);
  }
}
