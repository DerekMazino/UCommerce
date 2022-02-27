// To parse this JSON data, do
//
//     final empty = emptyFromMap(jsonString);

import 'dart:convert';

class Tienda {
  Tienda({
    required this.idTienda,
    required this.nombre,
    this.descripcion,
    this.logo,
    required this.categoriaId,
    required this.usuarioId,
  });

  int idTienda;
  String nombre;
  String? descripcion;
  String? logo;
  int categoriaId;
  int usuarioId;

  factory Tienda.fromJson(String str) => Tienda.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tienda.fromMap(Map<String, dynamic> json) => Tienda(
        idTienda: json["id_tienda"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        logo: json["logo"],
        categoriaId: json["categoria_id"],
        usuarioId: json["usuario_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_tienda": idTienda,
        "nombre": nombre,
        "descripcion": descripcion,
        "logo": logo,
        "categoria_id": categoriaId,
        "usuario_id": usuarioId,
      };
}
