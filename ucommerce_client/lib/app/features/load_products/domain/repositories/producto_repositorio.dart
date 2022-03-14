import 'package:u_commerce_client_prototype/app/features/load_products/domain/models/product_model.dart';

abstract class ProductoRepository {
  Future<List<ProductoModel>> getProducts();
}
