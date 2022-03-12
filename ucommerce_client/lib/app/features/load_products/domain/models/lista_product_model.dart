import 'dart:convert';

import 'package:u_commerce_client_prototype/app/features/load_products/domain/models/product_model.dart';

class ListaProductos {
  ListaProductos({
    required this.productos,
  });

  List<ProductoModel> productos;

  factory ListaProductos.fromJson(String str) =>
      ListaProductos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListaProductos.fromMap(Map<String, dynamic> json) => ListaProductos(
        productos: List<ProductoModel>.from(
            json["tiendas"].map((x) => ProductoModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
      };
}
