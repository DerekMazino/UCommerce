// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:equatable/equatable.dart';

class ProductoR extends Equatable {
  ProductoR({
    required this.tienda,
    required this.producto,
    required this.descripcion,
    required this.ventasTotales,
  });

  final String tienda;
  final String producto;
  final String descripcion;
  final int ventasTotales;

  @override
  List<Object?> get props => [tienda, producto, descripcion, ventasTotales];
}
