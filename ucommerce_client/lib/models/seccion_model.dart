// To parse this JSON data, do
//
//     final empty = emptyFromMap(jsonString);

import 'dart:convert';

class Seccion {
  Seccion({
    required this.idSeccion,
    required this.nombre,
    this.descripcion,
    required this.tiendaId,
  });

  int idSeccion;
  String nombre;
  String? descripcion;
  int tiendaId;

  factory Seccion.fromJson(String str) => Seccion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Seccion.fromMap(Map<String, dynamic> json) => Seccion(
        idSeccion: json["id_seccion"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        tiendaId: json["tienda_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_seccion": idSeccion,
        "nombre": nombre,
        "descripcion": descripcion,
        "tienda_id": tiendaId,
      };
}
