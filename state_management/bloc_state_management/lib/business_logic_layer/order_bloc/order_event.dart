part of 'order_bloc.dart';

abstract class OrderEvent {}

class NewOrderPlaced extends OrderEvent {
  final List<ProductModel> products;

  NewOrderPlaced({required this.products});
}
