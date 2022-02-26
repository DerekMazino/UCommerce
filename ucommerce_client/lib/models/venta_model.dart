// To parse this JSON data, do
//
//     final venta = ventaFromMap(jsonString);

import 'dart:convert';

class Venta {
  Venta({
    required this.idVenta,
    required this.tiendaId,
    required this.clienteId,
    required this.fechaVenta,
    this.totalPagar,
    this.metodoPagoId,
  });

  int idVenta;
  int tiendaId;
  int clienteId;
  DateTime fechaVenta;
  int? totalPagar;
  int? metodoPagoId;

  factory Venta.fromJson(String str) => Venta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venta.fromMap(Map<String, dynamic> json) => Venta(
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
