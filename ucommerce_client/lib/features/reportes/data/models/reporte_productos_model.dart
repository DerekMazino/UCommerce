// To parse this JSON data, do
//
//     final reporte = reporteFromMap(jsonString);

import 'dart:convert';

import 'package:ucommerce_client/features/reportes/data/models/producto_model.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_tiendas_entity.dart';

class ReporteProductosModel extends ReporteProductos {
  ReporteProductosModel({
    required List<ProductoModel> productos,
  }) : super(productos: productos);

  factory ReporteProductosModel.fromJson(String str) =>
      ReporteProductosModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReporteProductosModel.fromMap(Map<String, dynamic> json) =>
      ReporteProductosModel(
        productos: List<ProductoModel>.from(
            json["tiendas"].map((x) => ProductoModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tiendas": List<dynamic>.from(productos.map((x) => x)),
      };
}
