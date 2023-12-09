part of 'purchase_bloc.dart';

@freezed
class PurchaseState with _$PurchaseState {
  const PurchaseState._();

  const factory PurchaseState({
    @Default([]) List<PurchaseModel> purchases,
    @Default(true) bool isLoading,
    Object? error,
  }) = _PurchaseState;
}
