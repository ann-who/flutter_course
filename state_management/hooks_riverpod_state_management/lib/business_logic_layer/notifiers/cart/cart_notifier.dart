import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hooks_riverpod_state_management/business_logic_layer/notifiers/cart/cart_state.dart';

import 'package:hooks_riverpod_state_management/data_layer/models/order_in_cart/order_in_cart_model.dart';
import 'package:hooks_riverpod_state_management/data_layer/models/product_model/product_model.dart';

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  // Adds item to cart.
  void add(ProductModel product) {
    var neededProduct = state.ordersInCart
        .where((element) => element.product == product)
        .firstOrNull;
    var neededOrderIndex = state.ordersInCart.indexOf(
      neededProduct ?? OrderInCartModel(product: product),
    );

    var updatedOrders = List<OrderInCartModel>.from(state.ordersInCart);
    var updatedProducts = Set<ProductModel>.from(state.currentProducts);

    if (neededOrderIndex == -1) {
      updatedOrders.add(OrderInCartModel(product: product));
    } else {
      updatedOrders[neededOrderIndex] = state.ordersInCart[neededOrderIndex]
          .copyWith(count: state.ordersInCart[neededOrderIndex].count + 1);
    }

    int totalPrice = updatedOrders.fold(
        0,
        (previousValue, order) =>
            previousValue + (order.product.price * order.count));

    for (var order in updatedOrders) {
      updatedProducts.add(order.product);
    }

    state = state.copyWith(
      ordersInCart: updatedOrders,
      totalPrice: totalPrice,
      currentProducts: updatedProducts,
    );
  }

  // Decrease items or delete single item
  void decrease(ProductModel product) {
    var neededProduct = state.ordersInCart
        .where((element) => element.product == product)
        .firstOrNull;
    var neededOrderIndex = state.ordersInCart.indexOf(
      neededProduct ?? OrderInCartModel(product: product),
    );

    var updatedOrders = List<OrderInCartModel>.from(state.ordersInCart);
    var updatedProducts = Set<ProductModel>.from(state.currentProducts);

    if (neededProduct != null && neededProduct.count == 1) {
      updatedOrders
          .removeWhere((orderInCart) => orderInCart.product == product);
    } else {
      updatedOrders[neededOrderIndex] = updatedOrders[neededOrderIndex]
          .copyWith(count: state.ordersInCart[neededOrderIndex].count - 1);
    }

    int totalPrice = updatedOrders.fold(
        0,
        (previousValue, order) =>
            previousValue + (order.product.price * order.count));

    for (var order in updatedOrders) {
      updatedProducts.add(order.product);
    }

    state = state.copyWith(
      ordersInCart: updatedOrders,
      totalPrice: totalPrice,
      currentProducts: updatedProducts,
    );
  }

  // Clear cart after placing an order
  void clearCart() {
    state = state.copyWith(
      ordersInCart: [],
      currentProducts: {},
      totalPrice: 0,
    );
  }
}
