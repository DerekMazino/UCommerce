import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/screens/shop/shop_controller.dart';

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopController(tiendaRepository: Get.find()));
  }
}
