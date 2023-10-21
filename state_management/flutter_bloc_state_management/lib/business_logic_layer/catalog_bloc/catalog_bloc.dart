import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/data_layer/models/product_model/product_model.dart';

import 'package:flutter_bloc_state_management/data_layer/repository/products_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_bloc.freezed.dart';
part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final ProductsRepository productsRepository;

  CatalogBloc({
    required this.productsRepository,
  }) : super(const CatalogState()) {
    on<CatalogLoaded>(_onCatalogLoaded);
    on<CategoryLoaded>(_onCategoryLoaded);
  }

  void _onCatalogLoaded(
    CatalogLoaded event,
    Emitter<CatalogState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    var updatedList = await productsRepository.getCategories();

    emit(state.copyWith(isLoading: false, categories: updatedList));
  }

  void _onCategoryLoaded(
    CategoryLoaded event,
    Emitter<CatalogState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    var updatedProducts = await productsRepository.getCategory(event.category);

    emit(state.copyWith(isLoading: false, categoryProducts: updatedProducts));
  }
}
