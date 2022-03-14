import 'dart:convert';

class ProductoModel {
  ProductoModel({
    required this.idProducto,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagen,
    required this.seccionId,
    required this.clasificacionId,
  });

  int idProducto;
  String nombre;
  String descripcion;
  int precio;
  String imagen;
  int seccionId;
  int clasificacionId;

  factory ProductoModel.fromJson(String str) =>
      ProductoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductoModel.fromMap(Map<String, dynamic> json) => ProductoModel(
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
