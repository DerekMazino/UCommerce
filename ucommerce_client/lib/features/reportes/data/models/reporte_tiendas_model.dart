// To parse this JSON data, do
//
//     final reporte = reporteFromMap(jsonString);

import 'dart:convert';

import 'package:ucommerce_client/features/reportes/data/models/tienda_model.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_productos_entity.dart';

class ReporteTiendasModel extends ReporteTiendas {
  ReporteTiendasModel({
    required List<TiendaModel> tiendas,
  }) : super(tiendas: tiendas);

  factory ReporteTiendasModel.fromJson(String str) =>
      ReporteTiendasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReporteTiendasModel.fromMap(Map<String, dynamic> json) =>
      ReporteTiendasModel(
        tiendas: List<TiendaModel>.from(
            json["tiendas"].map((x) => TiendaModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tiendas": List<dynamic>.from(tiendas.map((x) => x)),
      };
}
