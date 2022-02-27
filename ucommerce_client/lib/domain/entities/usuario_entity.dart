import 'package:equatable/equatable.dart';

class Usuario extends Equatable {
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

  final int idUsuario;
  final String nombre;
  final String apellido;
  final String codigo;
  final String email;
  final String celular;
  final String? imagen;
  final String userPassword;

  @override

  // TODO: implement props
  List<Object?> get props =>
      [nombre, apellido, codigo, email, celular, imagen, userPassword];
}
