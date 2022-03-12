import 'package:get/instance_manager.dart';
import 'package:u_commerce_client_prototype/app/screens/home/admin/admin_controller.dart';
import 'package:u_commerce_client_prototype/app/screens/home/cart/cart_controller.dart';
import 'package:u_commerce_client_prototype/app/screens/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(productoRepository: Get.find()));
    Get.lazyPut(() => CartController(ventaRepository: Get.find()));
    Get.lazyPut(() => AdminController(laodReportsRepository: Get.find()));
  }
}
