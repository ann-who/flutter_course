import 'package:hooks_riverpod_state_management/data_layer/models/product_model/product_model.dart';

abstract class ProductsRepository {
  Future<List<String>> getCategories();
  Future<List<ProductModel>> getCategory(String categoryName);
  Future<List<ProductModel>> searchProduct(String name);
}
