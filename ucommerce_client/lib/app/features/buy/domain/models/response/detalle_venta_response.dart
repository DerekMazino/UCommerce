// To parse this JSON data, do
//
//     final detalleVentaResponse = detalleVentaResponseFromMap(jsonString);

import 'dart:convert';

class DetalleVentaResponse {
  DetalleVentaResponse({
    required this.idDetalleVenta,
    required this.ventaId,
    required this.productoId,
    required this.precioUnitario,
    required this.cantidad,
  });

  int idDetalleVenta;
  int ventaId;
  int productoId;
  int precioUnitario;
  int cantidad;

  factory DetalleVentaResponse.fromJson(String str) =>
      DetalleVentaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetalleVentaResponse.fromMap(Map<String, dynamic> json) =>
      DetalleVentaResponse(
        idDetalleVenta: json["id_detalle_venta"],
        ventaId: json["venta_id"],
        productoId: json["producto_id"],
        precioUnitario: json["precio_unitario"],
        cantidad: json["cantidad"],
      );

  Map<String, dynamic> toMap() => {
        "id_detalle_venta": idDetalleVenta,
        "venta_id": ventaId,
        "producto_id": productoId,
        "precio_unitario": precioUnitario,
        "cantidad": cantidad,
      };
}
