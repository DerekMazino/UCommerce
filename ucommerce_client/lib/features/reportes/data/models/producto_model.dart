// To parse this JSON data, do
//
//     final reporte = reporteFromMap(jsonString);

import 'dart:convert';

import 'package:ucommerce_client/features/reportes/domain/entities/producto_entity.dart';

class ProductoModel extends ProductoR {
  ProductoModel(
      {required String tienda,
      required String producto,
      required String descripcion,
      required int ventasTotales})
      : super(
            tienda: tienda,
            producto: producto,
            descripcion: descripcion,
            ventasTotales: ventasTotales);

  factory ProductoModel.fromJson(String str) =>
      ProductoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductoModel.fromMap(Map<String, dynamic> json) => ProductoModel(
        tienda: json["Tienda"],
        producto: json["Producto"],
        descripcion: json["Descripcion"],
        ventasTotales: json["Ventas totales"],
      );

  Map<String, dynamic> toMap() => {
        "Tienda": tienda,
        "Producto": producto,
        "Descripcion": descripcion,
        "Ventas totales": ventasTotales,
      };
}
