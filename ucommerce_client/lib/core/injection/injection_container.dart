import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucommerce_client/core/network/network_info.dart';
import 'package:ucommerce_client/features/reportes/data/datasources/local/reporte_productos_local_datasources.dart';
import 'package:ucommerce_client/features/reportes/data/datasources/local/reporte_tiendas_local_datasource.dart';
import 'package:ucommerce_client/features/reportes/data/datasources/remote/reporte_productos_remote_datasources.dart';
import 'package:ucommerce_client/features/reportes/data/datasources/remote/reporte_tiendas_remote_datasource.dart';
import 'package:ucommerce_client/features/reportes/data/repositories/reportes_repository_impl.dart';
import 'package:ucommerce_client/features/reportes/domain/repositories/reportes_repository.dart';
import 'package:ucommerce_client/features/reportes/domain/usecases/get_reporte_productos.dart';
import 'package:ucommerce_client/features/reportes/presentation/bloc/bloc_reporte_productos/reporte_productos_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //Bloc
  serviceLocator.registerFactory(() => ReporteProductosBloc(serviceLocator()));

  //UseCases
  serviceLocator
      .registerLazySingleton(() => GetReporteProductos(serviceLocator()));

  //Repository
  serviceLocator.registerLazySingleton<ReportesRepository>(() =>
      ReportesRepositoryImpl(
          localDataSourceProductos: serviceLocator(),
          remoteDataSourceProductos: serviceLocator(),
          networkInfo: serviceLocator(),
          localDataSourceTiendas: serviceLocator(),
          remoteDataSourceTiendas: serviceLocator()));

  //DataSources
  serviceLocator.registerLazySingleton<ReporteProductosLocalDataSource>(
      () => ReporteProductosLocalDataSourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ReporteTiendasLocalDataSource>(
      () => ReporteTiendasLocalDataSourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ReporteProductosRemoteDataSource>(
      () => ReporteProductosRemoteDataSourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ReporteTiendasRemoteDataSource>(
      () => ReporteTiendasRemoteDataSourceImpl(serviceLocator()));

  //! Core
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(serviceLocator()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => Connectivity());
}
