part of 'cart_bloc.dart';

abstract class CartEvent {}

class ProductAdded extends CartEvent {
  final ProductModel product;

  ProductAdded({required this.product});
}

class ProductDecreased extends CartEvent {
  final ProductModel product;

  ProductDecreased({required this.product});
}

class CartCleared extends CartEvent {
  CartCleared();
}
