part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    @Default([]) List<ProductModel> foundedProducts,
    @Default(false) bool isLoading,
  }) = _SearchState;
}
