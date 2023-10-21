import 'package:flutter/material.dart';

import 'package:simple_state_management/data_layer/models/product_model/product_model.dart';
import 'package:simple_state_management/data_layer/repository/products_repository.dart';

class SearchNotifier extends ChangeNotifier {
  final ProductsRepository productsRepository;

  SearchNotifier({required this.productsRepository});

  List<ProductModel> foundedProducts = [];
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  searchProduct(String name) async {
    isLoading = true;
    List<ProductModel> response = await productsRepository.searchProduct(name);
    foundedProducts = response;
    isLoading = false;
    notifyListeners();

    return foundedProducts;
  }
}
