import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_product_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_shop_model.dart';

abstract class LaodReportsRepository {
  Future<List<ReporteTiendaModel>> getReportShop(
      String fechaInicio, String fechaFin, String orden);
  Future<List<ReporteProductoModel>> getReportProduct(
      String fechaInicio, String fechaFin, String orden);
}
