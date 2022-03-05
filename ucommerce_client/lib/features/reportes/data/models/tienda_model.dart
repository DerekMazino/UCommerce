// To parse this JSON data, do
//
//     final reporte = reporteFromMap(jsonString);

import 'dart:convert';

import 'package:ucommerce_client/features/reportes/domain/entities/tienda_entity.dart';

class TiendaModel extends TiendaR {
  TiendaModel({
    required String nombre,
    required String descripcion,
    required int ventasTotales,
  }) : super(
            nombre: nombre,
            descripcion: descripcion,
            ventasTotales: ventasTotales);

  factory TiendaModel.fromJson(String str) =>
      TiendaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TiendaModel.fromMap(Map<String, dynamic> json) => TiendaModel(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        ventasTotales: json["Ventas totales"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "Ventas totales": ventasTotales,
      };
}
