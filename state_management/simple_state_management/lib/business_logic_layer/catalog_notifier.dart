import 'package:flutter/material.dart';

import 'package:simple_state_management/data_layer/models/product_model/product_model.dart';
import 'package:simple_state_management/data_layer/repository/products_repository.dart';

class CatalogNotifier extends ChangeNotifier {
  final ProductsRepository productsRepository;

  CatalogNotifier({required this.productsRepository});

  List<String> categories = [];
  List<ProductModel> categoryProducts = [];
  bool isLoading = false;

  void init() {
    getCategories();
  }

  getCategories() async {
    isLoading = true;
    List<String> response = await productsRepository.getCategories();
    categories = response;
    isLoading = false;
    notifyListeners();

    return categories;
  }

  getCategoryProducts(String categoryName) async {
    isLoading = true;
    List<ProductModel> response =
        await productsRepository.getCategory(categoryName);
    categoryProducts = response;
    isLoading = false;
    notifyListeners();

    return categoryProducts;
  }
}
