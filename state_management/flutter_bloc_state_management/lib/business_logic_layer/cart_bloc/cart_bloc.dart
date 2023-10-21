import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/data_layer/models/order_in_cart/order_in_cart_model.dart';
import 'package:flutter_bloc_state_management/data_layer/models/product_model/product_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<ProductAdded>(_onProductAdded);
    on<ProductDecreased>(_onProductDecreased);
    on<CartCleared>(_onCartCleared);
  }

  void _onProductAdded(
    ProductAdded event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    var currentCart = List<OrderInCartModel>.from(state.ordersInCart);
    var currentProducts = Set<ProductModel>.from(state.currentProducts);

    var neededProduct = currentCart
        .where((element) => element.product == event.product)
        .firstOrNull;

    var neededOrderIndex = currentCart.indexOf(
      neededProduct ?? OrderInCartModel(product: event.product),
    );

    var updatedCart = currentCart;

    if (neededOrderIndex == -1) {
      updatedCart.add(OrderInCartModel(product: event.product));
    } else {
      updatedCart[neededOrderIndex] = updatedCart[neededOrderIndex]
          .copyWith(count: updatedCart[neededOrderIndex].count + 1);
    }

    int totalPrice = state.ordersInCart.fold(
        0,
        (previousValue, order) =>
            previousValue + (order.product.price * order.count));

    for (var order in updatedCart) {
      currentProducts.add(order.product);
    }

    emit(
      state.copyWith(
        isLoading: false,
        ordersInCart: updatedCart,
        currentProducts: currentProducts,
        totalPrice: totalPrice,
      ),
    );
  }

  void _onProductDecreased(
    ProductDecreased event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    var currentCart = List<OrderInCartModel>.from(state.ordersInCart);
    var currentProducts = Set<ProductModel>.from(state.currentProducts);

    var neededProduct = currentCart
        .where((element) => element.product == event.product)
        .firstOrNull;
    var neededOrderIndex = currentCart.indexOf(
      neededProduct ?? OrderInCartModel(product: event.product),
    );

    var updatedCart = currentCart;

    if (neededProduct != null && neededProduct.count == 1) {
      updatedCart.removeAt(neededOrderIndex);
    } else {
      updatedCart[neededOrderIndex] = updatedCart[neededOrderIndex]
          .copyWith(count: updatedCart[neededOrderIndex].count - 1);
    }

    int totalPrice = state.ordersInCart.fold(
        0,
        (previousValue, order) =>
            previousValue + (order.product.price * order.count));

    for (var order in updatedCart) {
      currentProducts.add(order.product);
    }

    emit(
      state.copyWith(
        isLoading: false,
        ordersInCart: updatedCart,
        currentProducts: currentProducts,
        totalPrice: totalPrice,
      ),
    );
  }

  void _onCartCleared(
    CartCleared event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<OrderInCartModel> updatedCart = [];
    Set<ProductModel> updatedProducts = {};

    emit(
      state.copyWith(
        isLoading: false,
        ordersInCart: updatedCart,
        currentProducts: updatedProducts,
        totalPrice: 0,
      ),
    );
  }
}
