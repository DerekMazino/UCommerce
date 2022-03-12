// To parse this JSON data, do
//
//     final reporteTiendasModel = reporteTiendasModelFromMap(jsonString);

import 'dart:convert';

class ReporteTiendaModel {
  ReporteTiendaModel({
    required this.nombre,
    required this.descripcion,
    required this.ventasTotales,
  });

  String nombre;
  String descripcion;
  int ventasTotales;

  factory ReporteTiendaModel.fromJson(String str) =>
      ReporteTiendaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReporteTiendaModel.fromMap(Map<String, dynamic> json) =>
      ReporteTiendaModel(
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
