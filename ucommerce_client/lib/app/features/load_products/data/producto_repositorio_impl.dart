import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:u_commerce_client_prototype/app/features/load_products/domain/models/lista_product_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_products/domain/models/product_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_products/domain/repositories/producto_repositorio.dart';

class ProductRepositoryImpl extends ProductoRepository {
  final List<ProductoModel> products = [];
  @override
  Future<List<ProductoModel>> getProducts() async {
    final resp = await http.get(Uri.parse(
        'https://u-commerce-server.herokuapp.com/api/productos/tiendas/7'));
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    //print("Prueba!!! ${productsMap['productos']}");
    List<ProductoModel> prueba = ListaProductos.fromMap(productsMap).productos;
    products.addAll(prueba);

    return products;
  }
}
