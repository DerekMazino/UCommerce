// To parse this JSON data, do
//
//     final reporteProductosModel = reporteProductosModelFromMap(jsonString);

import 'dart:convert';

class ReporteProductoModel {
  ReporteProductoModel({
    required this.tienda,
    required this.producto,
    required this.descripcion,
    required this.ventasTotales,
  });

  String tienda;
  String producto;
  String descripcion;
  int ventasTotales;

  factory ReporteProductoModel.fromJson(String str) =>
      ReporteProductoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReporteProductoModel.fromMap(Map<String, dynamic> json) =>
      ReporteProductoModel(
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
