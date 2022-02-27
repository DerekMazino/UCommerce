// To parse this JSON data, do
//
//     final detalleVenta = detalleVentaFromMap(jsonString);

import 'dart:convert';

class DetalleVenta {
  DetalleVenta({
    required this.ventaId,
    required this.productoId,
    required this.precioUnitario,
    required this.cantidad,
  });

  int ventaId;
  int productoId;
  int precioUnitario;
  int cantidad;

  factory DetalleVenta.fromJson(String str) =>
      DetalleVenta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetalleVenta.fromMap(Map<String, dynamic> json) => DetalleVenta(
        ventaId: json["venta_id"],
        productoId: json["producto_id"],
        precioUnitario: json["precio_unitario"],
        cantidad: json["cantidad"],
      );

  Map<String, dynamic> toMap() => {
        "venta_id": ventaId,
        "producto_id": productoId,
        "precio_unitario": precioUnitario,
        "cantidad": cantidad,
      };
}
