import 'package:get/instance_manager.dart';
import 'package:u_commerce_client_prototype/app/screens/splash_screen/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
