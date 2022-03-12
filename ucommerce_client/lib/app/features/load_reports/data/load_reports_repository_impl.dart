import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/lista_reporte_producto_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/lista_reporte_shop_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_shop_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_product_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/repositories/load_reports_repository.dart';

class LaodReportsRepositoryImpl implements LaodReportsRepository {
  final List<ReporteProductoModel> products = [];
  final List<ReporteTiendaModel> shops = [];
  @override
  Future<List<ReporteProductoModel>> getReportProduct(
      String fechaInicio, String fechaFin, String orden) async {
    products.clear();
    final resp = await http.get(Uri.parse(
        'https://u-commerce-server.herokuapp.com/api/reporteproductos/$fechaInicio/$fechaFin/$orden'));
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    List<ReporteProductoModel> prueba =
        ReporteProductosModel.fromMap(productsMap).reporteProductoModel;
    products.addAll(prueba);
    return products;
  }

  @override
  Future<List<ReporteTiendaModel>> getReportShop(
      String fechaInicio, String fechaFin, String orden) async {
    shops.clear();
    final resp = await http.get(Uri.parse(
        'https://u-commerce-server.herokuapp.com/api/reporteventas/$fechaInicio/$fechaFin/$orden'));
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    List<ReporteTiendaModel> prueba =
        ReporteTiendasModel.fromMap(productsMap).reporteTiendaModel;
    shops.addAll(prueba);
    return shops;
  }
}
