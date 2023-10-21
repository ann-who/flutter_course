import 'dart:async';

import 'package:bloc_state_management/data_layer/models/order_in_cart/order_in_cart_model.dart';
import 'package:bloc_state_management/data_layer/models/product_model/product_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc {
  var currentState = const CartState();

  final _stateController = StreamController<CartState>.broadcast();
  final _eventsController = StreamController<CartEvent>();

  Stream<CartState> get state => _stateController.stream;
  Sink<CartEvent> get event => _eventsController.sink;

  CartBloc() {
    _eventsController.stream.listen(_handleEvent);
  }

  void _handleEvent(CartEvent event) {
    if (event is ProductAdded) {
      _onProductAdded(event.product);
    } else if (event is ProductDecreased) {
      _onProductDecreased(event.product);
    } else if (event is CartCleared) {
      _onCartCleared();
    }
  }

  void _onProductAdded(ProductModel product) async {
    currentState = currentState.copyWith(isLoading: true);
    _stateController.add(currentState);

    var currentCart = List<OrderInCartModel>.from(currentState.ordersInCart);
    var currentProducts = Set<ProductModel>.from(currentState.currentProducts);

    var neededProduct =
        currentCart.where((element) => element.product == product).firstOrNull;

    var neededOrderIndex = currentCart.indexOf(
      neededProduct ?? OrderInCartModel(product: product),
    );

    var updatedCart = currentCart;

    if (neededOrderIndex == -1) {
      updatedCart.add(OrderInCartModel(product: product));
    } else {
      updatedCart[neededOrderIndex] = updatedCart[neededOrderIndex]
          .copyWith(count: updatedCart[neededOrderIndex].count + 1);
    }

    int totalPrice = updatedCart.fold(
        0,
        (previousValue, order) =>
            previousValue + (order.product.price * order.count));

    for (var order in updatedCart) {
      currentProducts.add(order.product);
    }

    currentState = currentState.copyWith(
      isLoading: false,
      ordersInCart: updatedCart,
      currentProducts: currentProducts,
      totalPrice: totalPrice,
    );

    _stateController.add(currentState);
  }

  void _onProductDecreased(ProductModel product) {
    currentState = currentState.copyWith(isLoading: true);
    _stateController.add(currentState);

    var currentCart = List<OrderInCartModel>.from(currentState.ordersInCart);
    var currentProducts = Set<ProductModel>.from(currentState.currentProducts);

    var neededProduct =
        currentCart.where((element) => element.product == product).firstOrNull;
    var neededOrderIndex = currentCart.indexOf(
      neededProduct ?? OrderInCartModel(product: product),
    );

    var updatedCart = currentCart;

    if (neededProduct != null && neededProduct.count == 1) {
      updatedCart.removeAt(neededOrderIndex);
    } else {
      updatedCart[neededOrderIndex] = updatedCart[neededOrderIndex]
          .copyWith(count: updatedCart[neededOrderIndex].count - 1);
    }

    int totalPrice = currentState.ordersInCart.fold(
        0,
        (previousValue, order) =>
            previousValue + (order.product.price * order.count));

    for (var order in updatedCart) {
      currentProducts.add(order.product);
    }

    currentState = currentState.copyWith(
      isLoading: false,
      ordersInCart: updatedCart,
      currentProducts: currentProducts,
      totalPrice: totalPrice,
    );

    _stateController.add(currentState);
  }

  void _onCartCleared() {
    currentState = currentState.copyWith(
      isLoading: false,
      ordersInCart: [],
      currentProducts: {},
      totalPrice: 0,
    );

    _stateController.add(currentState);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }
}
