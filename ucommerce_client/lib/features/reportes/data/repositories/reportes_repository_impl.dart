import 'package:ucommerce_client/features/reportes/domain/entities/reporte_tiendas_entity.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_productos_entity.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ucommerce_client/features/reportes/domain/repositories/reportes_repository.dart';

class ReportesRepositoryImpl implements ReportesRepository {
  @override
  Future<Either<Failure, ReporteProductos>> getReporteProductos(
      String fechaInicio, String fechaFin, String orden) {
    // TODO: implement getReporteProductos
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ReporteTiendas>> getReporteTiendas(
      String fechaInicio, String fechaFin, String orden) {
    // TODO: implement getReporteTiendas
    throw UnimplementedError();
  }
}
