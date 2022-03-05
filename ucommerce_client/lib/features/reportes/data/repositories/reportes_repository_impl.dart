import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ucommerce_client/core/error/exception.dart';
import 'package:ucommerce_client/core/network/network_info.dart';
import 'package:ucommerce_client/features/reportes/data/datasources/local/reporte_productos_local_datasources.dart';
import 'package:ucommerce_client/features/reportes/data/datasources/local/reporte_tiendas_local_datasource.dart';
import 'package:ucommerce_client/features/reportes/data/datasources/remote/reporte_productos_remote_datasources.dart';
import 'package:ucommerce_client/features/reportes/data/datasources/remote/reporte_tiendas_remote_datasource.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_tiendas_entity.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_productos_entity.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ucommerce_client/features/reportes/domain/repositories/reportes_repository.dart';

class ReportesRepositoryImpl implements ReportesRepository {
  final ReporteProductosLocalDataSource? localDataSourceProductos;
  final ReporteProductosRemoteDataSource? remoteDataSourceProductos;
  final ReporteTiendasLocalDataSource? localDataSourceTiendas;
  final ReporteTiendasRemoteDataSource? remoteDataSourceTiendas;
  final NetworkInfo? networkInfo;

  ReportesRepositoryImpl(
      {this.remoteDataSourceProductos,
      this.localDataSourceProductos,
      this.networkInfo,
      this.localDataSourceTiendas,
      this.remoteDataSourceTiendas});

  @override
  Future<Either<Failure, ReporteProductos>> getReporteProductos(
      String fechaInicio, String fechaFin, String orden) async {
    var result = await networkInfo!.isConnected;
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final remoteReporte = await remoteDataSourceProductos!
            .getReporte(fechaInicio, fechaFin, orden);
        localDataSourceProductos!.cacheReport(remoteReporte);
        return Right(remoteReporte);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localReporte = await localDataSourceProductos!.getLastReport();
        return Right(localReporte);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, ReporteTiendas>> getReporteTiendas(
      String fechaInicio, String fechaFin, String orden) async {
    var result = await networkInfo!.isConnected;
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final remoteReporte = await remoteDataSourceTiendas!
            .getReporte(fechaInicio, fechaFin, orden);
        localDataSourceTiendas!.cacheReport(remoteReporte);
        return Right(remoteReporte);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localReporte = await localDataSourceTiendas!.getLastReport();
        return Right(localReporte);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
