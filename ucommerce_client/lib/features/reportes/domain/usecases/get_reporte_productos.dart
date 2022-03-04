import 'package:equatable/equatable.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ucommerce_client/core/usecases/usecase.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_tiendas.dart';
import 'package:ucommerce_client/features/reportes/domain/repositories/reportes_repository.dart';

class GetReporteProductos implements UseCase<ReporteProductos, Params> {
  final ReportesRepository? reportesRepository;

  GetReporteProductos(this.reportesRepository);
  @override
  Future<Either<Failure, ReporteProductos>> call(Params params) async {
    return await reportesRepository!
        .getReporteProductos(params.fechaInicio, params.fechaFin, params.orden);
  }
}

class Params extends Equatable {
  final String fechaInicio;
  final String fechaFin;
  final String orden;

  Params(
      {required this.fechaInicio, required this.fechaFin, required this.orden});

  @override
  List<Object?> get props => [fechaInicio, fechaFin, orden];
}
