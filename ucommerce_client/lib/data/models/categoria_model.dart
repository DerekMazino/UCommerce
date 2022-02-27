// To parse this JSON data, do
//
//     final empty = emptyFromMap(jsonString);

import 'dart:convert';

class Categoria {
  Categoria({
    required this.idCategoria,
    required this.nombre,
    required this.descripcion,
  });

  int idCategoria;
  String nombre;
  String descripcion;

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        idCategoria: json["id_categoria"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "id_categoria": idCategoria,
        "nombre": nombre,
        "descripcion": descripcion,
      };
}
