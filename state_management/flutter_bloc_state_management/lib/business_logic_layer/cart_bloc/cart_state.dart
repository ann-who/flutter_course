part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    @Default([]) List<OrderInCartModel> ordersInCart,

    // unique products to show the pics in orders list
    @Default({}) Set<ProductModel> currentProducts,
    @Default(0) int totalPrice,
    @Default(false) bool isLoading,
  }) = _CartState;
}
