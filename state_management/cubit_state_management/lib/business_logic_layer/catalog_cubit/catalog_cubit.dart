import 'dart:async';

import 'package:cubit_state_management/data_layer/models/product_model/product_model.dart';

import 'package:cubit_state_management/data_layer/repository/products_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_cubit.freezed.dart';
part 'catalog_state.dart';

class CatalogCubit {
  final ProductsRepository productsRepository;

  var currentState = const CatalogState();

  final _stateController = StreamController<CatalogState>.broadcast();

  Stream<CatalogState> get state => _stateController.stream;

  CatalogCubit({required this.productsRepository});

  void loadCatalog() async {
    currentState = currentState.copyWith(isLoading: true);
    _stateController.add(currentState);

    var updatedList = await productsRepository.getCategories();

    currentState = currentState.copyWith(
      isLoading: false,
      categories: updatedList,
    );

    _stateController.add(currentState);
  }

  void loadCategory(String category) async {
    currentState = currentState.copyWith(isLoading: true);
    _stateController.add(currentState);

    var categories = List<String>.from(currentState.categories);
    var updatedProducts = await productsRepository.getCategory(category);

    currentState = currentState.copyWith(
      isLoading: false,
      categories: categories,
      categoryProducts: updatedProducts,
    );

    _stateController.add(currentState);
  }

  void dispose() {
    _stateController.close();
  }
}
