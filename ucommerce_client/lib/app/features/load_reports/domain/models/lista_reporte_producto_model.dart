import 'dart:convert';

import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_product_model.dart';

class ReporteProductosModel {
  ReporteProductosModel({
    required this.reporteProductoModel,
  });

  List<ReporteProductoModel> reporteProductoModel;

  factory ReporteProductosModel.fromJson(String str) =>
      ReporteProductosModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReporteProductosModel.fromMap(Map<String, dynamic> json) =>
      ReporteProductosModel(
        reporteProductoModel: List<ReporteProductoModel>.from(
            json["tiendas"].map((x) => ReporteProductoModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tiendas":
            List<dynamic>.from(reporteProductoModel.map((x) => x.toMap())),
      };
}
