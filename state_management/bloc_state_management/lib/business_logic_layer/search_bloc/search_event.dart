part of 'search_bloc.dart';

abstract class SearchEvent {}

class ProductsFounded extends SearchEvent {
  final String name;

  ProductsFounded({required this.name});
}
