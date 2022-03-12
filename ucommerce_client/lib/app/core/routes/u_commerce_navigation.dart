import 'package:get/route_manager.dart';
import 'package:u_commerce_client_prototype/app/core/injection/home_binding.dart';
import 'package:u_commerce_client_prototype/app/core/injection/shop_binding.dart';
import 'package:u_commerce_client_prototype/app/core/injection/splash_binding.dart';
import 'package:u_commerce_client_prototype/app/screens/home/admin/reporte_producto_screen.dart';
import 'package:u_commerce_client_prototype/app/screens/home/admin/reporte_tienda_screen.dart';
import 'package:u_commerce_client_prototype/app/screens/screens.dart';
import 'package:u_commerce_client_prototype/app/screens/shop/shop_screen.dart';

class UCommerceRoutes {
  static final String splash = '/splash';
  static final String shop = '/shop';
  static final String home = '/home';
  static final String reportsProducts = '/report_products';
  static final String reportsShops = '/report_shops';
}

class UCommercePages {
  static final pages = [
    GetPage(
        name: UCommerceRoutes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: UCommerceRoutes.shop,
        page: () => ShopScreen(),
        binding: ShopBinding()),
    GetPage(
        name: UCommerceRoutes.home,
        page: () => HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: UCommerceRoutes.reportsProducts,
        page: () => ReporteProductoScreen()),
    GetPage(
        name: UCommerceRoutes.reportsShops, page: () => ReporteTiendaScreen()),
  ];
}
