import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:u_commerce_client_prototype/app/screens/screens.dart';
import 'package:u_commerce_client_prototype/app/screens/splash_screen/splash_controller.dart';
import 'package:u_commerce_client_prototype/app/theme.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          UcommerceColors.color3,
          UcommerceColors.color4,
          UcommerceColors.color1
        ],
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/logoshop.png'),
            ),
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 10),
          Text('U-Commerce',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.bold, color: UcommerceColors.color5))
        ],
      ),
    ));
  }
}
