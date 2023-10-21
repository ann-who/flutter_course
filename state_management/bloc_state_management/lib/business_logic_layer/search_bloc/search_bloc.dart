import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:bloc_state_management/data_layer/models/product_model/product_model.dart';

import 'package:bloc_state_management/data_layer/repository/products_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc {
  final ProductsRepository productsRepository;
  final TextEditingController searchController = TextEditingController();

  var _currentState = const SearchState();

  final _stateController = StreamController<SearchState>.broadcast();
  final _eventsController = StreamController<SearchEvent>();

  Stream<SearchState> get state => _stateController.stream;
  Sink<SearchEvent> get event => _eventsController.sink;

  SearchBloc({
    required this.productsRepository,
  }) {
    _eventsController.stream.listen(_handleEvent);
  }

  void _handleEvent(SearchEvent event) {
    if (event is ProductsFounded) {
      _onProductsFounded(event.name);
    }
  }

  void _onProductsFounded(String name) async {
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
    _eventsController.close();
  }
}
