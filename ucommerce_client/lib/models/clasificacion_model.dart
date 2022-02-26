// To parse this JSON data, do
//
//     final empty = emptyFromMap(jsonString);

import 'dart:convert';

class Clasificacion {
  Clasificacion({
    required this.idClasificacion,
    required this.nombre,
    required this.descripcion,
  });

  int idClasificacion;
  String nombre;
  String descripcion;

  factory Clasificacion.fromJson(String str) =>
      Clasificacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Clasificacion.fromMap(Map<String, dynamic> json) => Clasificacion(
        idClasificacion: json["id_clasificacion"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "id_clasificacion": idClasificacion,
        "nombre": nombre,
        "descripcion": descripcion,
      };
}
