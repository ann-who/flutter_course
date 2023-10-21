import 'package:flutter/material.dart';

import 'package:simple_state_management/data_layer/models/order_in_cart/order_in_cart_model.dart';
import 'package:simple_state_management/data_layer/models/product_model/product_model.dart';

class CartNotifier extends ChangeNotifier {
  final List<OrderInCartModel> ordersInCart = [];

  // If a product is already selected, show its count
  String productCount(ProductModel product) => ordersInCart
      .where((element) => element.product == product)
      .first
      .count
      .toString();

  // Total price for all cart
  int get totalPrice => ordersInCart.fold(
      0,
      (previousValue, order) =>
          previousValue + (order.product.price * order.count));

  List<ProductModel> products() {
    List<ProductModel> currentProducts = [];

    for (var order in ordersInCart) {
      currentProducts.add(order.product);
    }

    return currentProducts;
  }

  // Adds item to cart.
  void add(ProductModel product) {
    var neededProduct =
        ordersInCart.where((element) => element.product == product).firstOrNull;
    var neededOrderIndex = ordersInCart.indexOf(
      neededProduct ?? OrderInCartModel(product: product),
    );

    if (neededOrderIndex == -1) {
      ordersInCart.add(OrderInCartModel(product: product));
    } else {
      ordersInCart[neededOrderIndex] = ordersInCart[neededOrderIndex]
          .copyWith(count: ordersInCart[neededOrderIndex].count + 1);
    }

    notifyListeners();
  }

  // Decrease same items if there are many of them in the order
  void decrease(ProductModel product) {
    var neededProduct =
        ordersInCart.where((element) => element.product == product).firstOrNull;
    var neededOrderIndex = ordersInCart.indexOf(
      neededProduct ?? OrderInCartModel(product: product),
    );

    if (neededProduct != null && neededProduct.count == 1) {
      removeAll(product);
    } else {
      ordersInCart[neededOrderIndex] = ordersInCart[neededOrderIndex]
          .copyWith(count: ordersInCart[neededOrderIndex].count - 1);
    }
    notifyListeners();
  }

  // Removes all same items from the cart
  void removeAll(ProductModel product) {
    ordersInCart.removeWhere((orderInCart) => orderInCart.product == product);

    notifyListeners();
  }

  // Clear cart after placing an order
  void clearCart() {
    ordersInCart.clear();
    notifyListeners();
  }
}
