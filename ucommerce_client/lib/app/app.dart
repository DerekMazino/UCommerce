import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:u_commerce_client_prototype/app/core/injection/main_binding.dart';
import 'package:u_commerce_client_prototype/app/core/routes/u_commerce_navigation.dart';
import 'package:u_commerce_client_prototype/app/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: UCommerceRoutes.splash,
      getPages: UCommercePages.pages,
      initialBinding: MainBingind(),
    );
  }
}
