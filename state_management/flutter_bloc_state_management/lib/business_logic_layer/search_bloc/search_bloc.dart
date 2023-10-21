import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/data_layer/models/product_model/product_model.dart';

import 'package:flutter_bloc_state_management/data_layer/repository/products_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductsRepository productsRepository;
  final TextEditingController searchController = TextEditingController();

  SearchBloc({
    required this.productsRepository,
  }) : super(const SearchState()) {
    on<ProductsFounded>(_onProductsFounded);
  }

  void _onProductsFounded(
    ProductsFounded event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    var updatedProducts = await productsRepository.searchProduct(event.name);

    emit(state.copyWith(isLoading: false, foundedProducts: updatedProducts));
  }
}
