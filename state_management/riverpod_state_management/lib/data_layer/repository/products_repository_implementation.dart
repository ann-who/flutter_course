import 'package:riverpod_state_management/data_layer/data_source/products_data_source.dart';
import 'package:riverpod_state_management/data_layer/models/product_model/product_model.dart';
import 'package:riverpod_state_management/data_layer/repository/products_repository.dart';

class ProductsRepositoryImplementation implements ProductsRepository {
  final ProductsDataSource productsDataSource;

  const ProductsRepositoryImplementation({required this.productsDataSource});

  @override
  Future<List<String>> getCategories() async {
    List<String> result = await productsDataSource.getCategories();

    return result;
  }

  @override
  Future<List<ProductModel>> getCategory(String categoryName) async {
    List<ProductModel> result =
        await productsDataSource.getCategory(categoryName);

    return result;
  }

  @override
  Future<List<ProductModel>> searchProduct(String name) async {
    List<ProductModel> result = await productsDataSource.searchProduct(name);
    return result;
  }
}
