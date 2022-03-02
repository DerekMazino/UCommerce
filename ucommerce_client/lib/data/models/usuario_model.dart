// To parse this JSON data, do
//
//     final usuarios = usuariosFromMap(jsonString);

import 'dart:convert';

import 'package:ucommerce_client/domain/entities/entities.dart';

class UsuarioModel extends UsuarioEntity {
  UsuarioModel({
    required int idUsuario,
    required String nombre,
    required String apellido,
    required String codigo,
    required String email,
    required String celular,
    String? imagen,
    required String userPassword,
  }) : super(
            idUsuario: idUsuario,
            nombre: nombre,
            apellido: apellido,
            codigo: codigo,
            email: email,
            celular: celular,
            imagen: imagen,
            userPassword: userPassword);

  factory UsuarioModel.fromJson(String str) =>
      UsuarioModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromMap(Map<String, dynamic> json) => UsuarioModel(
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
