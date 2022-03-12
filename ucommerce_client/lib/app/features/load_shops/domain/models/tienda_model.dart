import 'dart:convert';

class TiendaModel {
  TiendaModel({
    required this.idTienda,
    required this.nombre,
    required this.descripcion,
    required this.logo,
    required this.categoriaId,
    required this.usuarioId,
  });

  int idTienda;
  String nombre;
  String descripcion;
  String logo;
  int categoriaId;
  int usuarioId;

  factory TiendaModel.fromJson(String str) =>
      TiendaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TiendaModel.fromMap(Map<String, dynamic> json) => TiendaModel(
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
