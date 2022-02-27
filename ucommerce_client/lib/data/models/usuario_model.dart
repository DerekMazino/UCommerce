// To parse this JSON data, do
//
//     final usuarios = usuariosFromMap(jsonString);

import 'dart:convert';

class Usuario {
  Usuario({
    required this.idUsuario,
    required this.nombre,
    required this.apellido,
    required this.codigo,
    required this.email,
    required this.celular,
    this.imagen,
    required this.userPassword,
  });

  int idUsuario;
  String nombre;
  String apellido;
  String codigo;
  String email;
  String celular;
  String? imagen;
  String userPassword;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        idUsuario: json["id_usuario"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        codigo: json["codigo"],
        email: json["email"],
        celular: json["celular"],
        imagen: json["imagen"],
        userPassword: json["user_password"],
      );

  Map<String, dynamic> toMap() => {
        "id_usuario": idUsuario,
        "nombre": nombre,
        "apellido": apellido,
        "codigo": codigo,
        "email": email,
        "celular": celular,
        "imagen": imagen,
        "user_password": userPassword,
      };
}
