import 'package:simple_state_management/data_layer/data_source/products_data_source.dart';
import 'package:simple_state_management/data_layer/models/product_model/product_model.dart';
import 'package:simple_state_management/data_layer/repository/products_repository.dart';

class ProductsRepositoryImplementation implements ProductsRepository {
  final ProductsDataSource productsDataSource;

  const ProductsRepositoryImplementation({required this.productsDataSource});

  @override
  Future<List<ProductModel>> getSkincare() async {
    List<ProductModel> result = await productsDataSource.getSkincare();

    return result;
  }
}
