import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ucommerce_client/core/error/exception.dart';
import 'package:ucommerce_client/features/reportes/data/models/reporte_tiendas_model.dart';

abstract class ReporteTiendasRemoteDataSource {
  Future<ReporteTiendasModel> getReporte(
      String fechaInicio, String fechaFin, String orden);
}

class ReporteTiendasRemoteDataSourceImpl
    implements ReporteTiendasRemoteDataSource {
  final http.Client? client;

  ReporteTiendasRemoteDataSourceImpl(this.client);

  @override
  Future<ReporteTiendasModel> getReporte(
      String fechaInicio, String fechaFin, String orden) async {
    final response = await client!.get(Uri.parse(
        'https://u-commerce-server.herokuapp.com/api/reporteventas/$fechaInicio/$fechaFin/$orden'));
    if (response.statusCode == 200 &&
        !response.body.contains('Report not found')) {
      return ReporteTiendasModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
