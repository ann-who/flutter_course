import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod_state_management/data_layer/models/product_model/product_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    @Default([]) List<ProductModel> foundedProducts,
    @Default(false) bool isLoading,
  }) = _SearchState;
}
