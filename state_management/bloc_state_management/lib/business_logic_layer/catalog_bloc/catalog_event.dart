part of 'catalog_bloc.dart';

abstract class CatalogEvent {}

class CatalogLoaded extends CatalogEvent {
  CatalogLoaded();
}

class CategoryLoaded extends CatalogEvent {
  final String category;

  CategoryLoaded({required this.category});
}
