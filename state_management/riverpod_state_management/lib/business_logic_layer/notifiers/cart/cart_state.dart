import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod_state_management/data_layer/models/order_in_cart/order_in_cart_model.dart';
import 'package:riverpod_state_management/data_layer/models/product_model/product_model.dart';

part 'cart_state.freezed.dart';

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
