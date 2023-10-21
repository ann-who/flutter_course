import 'dart:async';

import 'package:bloc_state_management/data_layer/models/product_model/product_model.dart';

import 'package:bloc_state_management/data_layer/repository/products_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_bloc.freezed.dart';
part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc {
  final ProductsRepository productsRepository;

  var currentState = const CatalogState();

  final _stateController = StreamController<CatalogState>.broadcast();
  final _eventsController = StreamController<CatalogEvent>();

  Stream<CatalogState> get state => _stateController.stream;
  Sink<CatalogEvent> get event => _eventsController.sink;

  CatalogBloc({required this.productsRepository}) {
    _eventsController.stream.listen(_handleEvent);
  }

  void _handleEvent(CatalogEvent event) {
    if (event is CatalogLoaded) {
      _onCatalogLoaded();
    } else if (event is CategoryLoaded) {
      _onCategoryLoaded(event.category);
    }
  }

  void _onCatalogLoaded() async {
    currentState = currentState.copyWith(isLoading: true);
    _stateController.add(currentState);

    var updatedList = await productsRepository.getCategories();

    currentState = currentState.copyWith(
      isLoading: false,
      categories: updatedList,
    );

    _stateController.add(currentState);
  }

  void _onCategoryLoaded(String category) async {
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
    _eventsController.close();
  }
}
