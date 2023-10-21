import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod_state_management/data_layer/models/product_model/product_model.dart';

part 'catalog_state.freezed.dart';

@freezed
class CatalogState with _$CatalogState {
  const CatalogState._();

  const factory CatalogState({
    @Default([]) List<String> categories,
    @Default([]) List<ProductModel> categoryProducts,
    @Default(false) bool isLoading,
  }) = _CatalogState;
}
