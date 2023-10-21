import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:cubit_state_management/data_layer/models/product_model/product_model.dart';

import 'package:cubit_state_management/data_layer/repository/products_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

class SearchBloc {
  final ProductsRepository productsRepository;
  final TextEditingController searchController = TextEditingController();

  var _currentState = const SearchState();

  final _stateController = StreamController<SearchState>.broadcast();

  Stream<SearchState> get state => _stateController.stream;

  SearchBloc({
    required this.productsRepository,
  });

  void findProducts(String name) async {
    _currentState = _currentState.copyWith(isLoading: true);
    _stateController.add(_currentState);

    var updatedProducts = await productsRepository.searchProduct(name);

    _currentState = _currentState.copyWith(
      isLoading: false,
      foundedProducts: updatedProducts,
    );

    _stateController.add(_currentState);
  }

  void dispose() {
    _stateController.close();
  }
}
