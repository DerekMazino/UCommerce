import 'dart:convert';

import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_shop_model.dart';

class ReporteTiendasModel {
  ReporteTiendasModel({
    required this.reporteTiendaModel,
  });

  List<ReporteTiendaModel> reporteTiendaModel;

  factory ReporteTiendasModel.fromJson(String str) =>
      ReporteTiendasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReporteTiendasModel.fromMap(Map<String, dynamic> json) =>
      ReporteTiendasModel(
        reporteTiendaModel: List<ReporteTiendaModel>.from(
            json["tiendas"].map((x) => ReporteTiendaModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tiendas": List<dynamic>.from(reporteTiendaModel.map((x) => x.toMap())),
      };
}
