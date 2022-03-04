import 'package:equatable/equatable.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ucommerce_client/core/usecases/usecase.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_productos.dart';
import 'package:ucommerce_client/features/reportes/domain/repositories/reportes_repository.dart';

class GetReporteTiendas implements UseCase<ReporteTiendas, Params> {
  final ReportesRepository? reportesRepository;

  GetReporteTiendas(this.reportesRepository);
  @override
  Future<Either<Failure, ReporteTiendas>> call(Params params) async {
    return await reportesRepository!
        .getReporteTiendas(params.fechaInicio, params.fechaFin, params.orden);
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
