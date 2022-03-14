import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:u_commerce_client_prototype/app/core/routes/u_commerce_navigation.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _loadHome();
    super.onReady();
  }

  void _loadHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(UCommerceRoutes.home);
    });
  }
}
