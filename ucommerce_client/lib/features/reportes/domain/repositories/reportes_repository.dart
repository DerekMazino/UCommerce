import 'package:dartz/dartz.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_productos.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_tiendas.dart';

abstract class ReportesRepository {
  Future<Either<Failure, ReporteTiendas>> getReporteTiendas(
      String fechaInicio, String fechaFin, String orden);
  Future<Either<Failure, ReporteProductos>> getReporteProductos(
      String fechaInicio, String fechaFin, String orden);
}
