// To parse this JSON data, do
//
//     final empty = emptyFromMap(jsonString);

import 'dart:convert';

class Producto {
  Producto({
    required this.idProducto,
    required this.nombre,
    this.descripcion,
    required this.precio,
    this.imagen,
    required this.seccionId,
    required this.clasificacionId,
  });

  int idProducto;
  String nombre;
  String? descripcion;
  int precio;
  String? imagen;
  int seccionId;
  int clasificacionId;

  factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        idProducto: json["id_producto"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        imagen: json["imagen"],
        seccionId: json["seccion_id"],
        clasificacionId: json["clasificacion_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_producto": idProducto,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "imagen": imagen,
        "seccion_id": seccionId,
        "clasificacion_id": clasificacionId,
      };
}
