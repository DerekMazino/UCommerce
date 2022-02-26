// To parse this JSON data, do
//
//     final empty = emptyFromMap(jsonString);

import 'dart:convert';

class MetodosPago {
  MetodosPago({
    required this.idMetodoPago,
    required this.nombre,
  });

  int idMetodoPago;
  String nombre;

  factory MetodosPago.fromJson(String str) =>
      MetodosPago.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetodosPago.fromMap(Map<String, dynamic> json) => MetodosPago(
        idMetodoPago: json["id_metodo_pago"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "id_metodo_pago": idMetodoPago,
        "nombre": nombre,
      };
}
