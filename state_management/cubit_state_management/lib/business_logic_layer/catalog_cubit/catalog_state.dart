part of 'catalog_cubit.dart';

@freezed
class CatalogState with _$CatalogState {
  const CatalogState._();

  const factory CatalogState({
    @Default([]) List<String> categories,
    @Default([]) List<ProductModel> categoryProducts,
    @Default(false) bool isLoading,
  }) = _CatalogState;
}
