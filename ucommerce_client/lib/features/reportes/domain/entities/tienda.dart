// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:equatable/equatable.dart';

class TiendaR extends Equatable {
  TiendaR({
    required this.nombre,
    required this.descripcion,
    required this.ventasTotales,
  });

  final String nombre;
  final String descripcion;
  final int ventasTotales;

  @override
  List<Object?> get props => [nombre, descripcion, ventasTotales];
}
