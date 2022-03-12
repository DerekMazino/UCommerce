import 'package:u_commerce_client_prototype/app/features/load_products/domain/models/product_model.dart';

class ProductCartModel {
  final ProductoModel product;
  int quantity;

  ProductCartModel({required this.product, this.quantity = 1});
}
