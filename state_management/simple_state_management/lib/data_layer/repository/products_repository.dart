import 'package:simple_state_management/data_layer/models/product_model/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> getSkincare();
}
