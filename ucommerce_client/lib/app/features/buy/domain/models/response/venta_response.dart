// To parse this JSON data, do
//
//     final ventaResponse = ventaResponseFromMap(jsonString);

import 'dart:convert';

class VentaResponse {
  VentaResponse({
    required this.idVenta,
    required this.tiendaId,
    required this.clienteId,
    required this.fechaVenta,
    required this.totalPagar,
    this.metodoPagoId,
  });

  int idVenta;
  int tiendaId;
  int clienteId;
  DateTime fechaVenta;
  dynamic totalPagar;
  dynamic metodoPagoId;

  factory VentaResponse.fromJson(String str) =>
      VentaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VentaResponse.fromMap(Map<String, dynamic> json) => VentaResponse(
        idVenta: json["id_venta"],
        tiendaId: json["tienda_id"],
        clienteId: json["cliente_id"],
        fechaVenta: DateTime.parse(json["fecha_venta"]),
        totalPagar: json["total_pagar"],
        metodoPagoId: json["metodo_pago_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_venta": idVenta,
        "tienda_id": tiendaId,
        "cliente_id": clienteId,
        "fecha_venta": fechaVenta.toIso8601String(),
        "total_pagar": totalPagar,
        "metodo_pago_id": metodoPagoId,
      };
}
