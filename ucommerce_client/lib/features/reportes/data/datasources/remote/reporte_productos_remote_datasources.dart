import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ucommerce_client/core/error/exception.dart';

import 'package:ucommerce_client/features/reportes/data/models/reporte_productos_model.dart';

abstract class ReporteProductosRemoteDataSource {
  Future<ReporteProductosModel> getReporte(
      String fechaInicio, String fechaFin, String orden);
}

class ReporteProductosRemoteDataSourceImpl
    implements ReporteProductosRemoteDataSource {
  final http.Client? client;

  ReporteProductosRemoteDataSourceImpl(this.client);

  @override
  Future<ReporteProductosModel> getReporte(
      String fechaInicio, String fechaFin, String orden) async {
    final response = await client!.get(Uri.parse(
        'https://u-commerce-server.herokuapp.com/api/reporteproductos/$fechaInicio/$fechaFin/$orden'));
    if (response.statusCode == 200 &&
        !response.body.contains('Report not found')) {
      return ReporteProductosModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
