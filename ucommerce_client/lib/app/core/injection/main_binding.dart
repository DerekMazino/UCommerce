import 'package:get/instance_manager.dart';
import 'package:u_commerce_client_prototype/app/features/buy/data/venta_repository_impl.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/repositories/venta_repository.dart';
import 'package:u_commerce_client_prototype/app/features/load_products/data/producto_repositorio_impl.dart';
import 'package:u_commerce_client_prototype/app/features/load_products/domain/repositories/producto_repositorio.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/data/load_reports_repository_impl.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/repositories/load_reports_repository.dart';
import 'package:u_commerce_client_prototype/app/features/load_shops/data/tienda_repository_impl.dart';
import 'package:u_commerce_client_prototype/app/features/load_shops/domain/repositories/tienda_repository.dart';

class MainBingind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductoRepository>(() => ProductRepositoryImpl());
    Get.lazyPut<TiendaRepository>(() => TiendaRepositoryImpl());
    Get.lazyPut<VentaRepository>(() => VentaRepositoryImpl());
    Get.lazyPut<LaodReportsRepository>(() => LaodReportsRepositoryImpl());
    //core
    //Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl());
  }
}
