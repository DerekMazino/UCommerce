import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/screens/home/cart/cart_controller.dart';
import 'package:u_commerce_client_prototype/app/screens/home/home_controller.dart';
import 'package:u_commerce_client_prototype/app/screens/home/productos/product_screen.dart';
import 'package:u_commerce_client_prototype/app/screens/screens.dart';
import 'package:u_commerce_client_prototype/app/theme.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Obx(
            () => IndexedStack(
              index: controller.indexSelected.value,
              children: [
                ProductScreen(),
                CartScreen(
                  onShoppingg: () {
                    /* setState(() {
                      currentIndex = 0;
                    }); */
                    controller.indexSelected.value = 0;
                  },
                ),
                const PerfilUsuarioScreen()
              ],
            ),
          )),
          Obx(
            () => _Ucommerce_navigation(
                index: controller.indexSelected.value,
                onIndexSelected: (index) {
                  controller.updateIndexSelected(index);
                }),
          )
        ],
      ),
    );
  }
}

class _Ucommerce_navigation extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();
  _Ucommerce_navigation({
    Key? key,
    required this.index,
    required this.onIndexSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: UcommerceColors.color6,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                color: UcommerceColors.color6,
                child: IconButton(
                  onPressed: () => onIndexSelected(0),
                  icon: Icon(
                    Icons.home,
                    color: index == 0
                        ? UcommerceColors.color4
                        : UcommerceColors.color1,
                  ),
                ),
              ),
              Material(
                color: UcommerceColors.color6,
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: UcommerceColors.color4,
                      child: IconButton(
                          onPressed: () => onIndexSelected(1),
                          icon: Icon(
                            Icons.shopping_bag_rounded,
                            color: index == 1
                                ? UcommerceColors.color3
                                : UcommerceColors.color1,
                          )),
                    ),
                    Positioned(
                        right: 0,
                        child: Obx(
                          () => cartController.totalItems.value == 0
                              ? const SizedBox.shrink()
                              : CircleAvatar(
                                  radius: 10,
                                  backgroundColor: UcommerceColors.color3,
                                  child: Text(cartController.totalItems.value
                                      .toString()),
                                ),
                        ))
                  ],
                ),
              ),
              Material(
                color: UcommerceColors.color6,
                child: IconButton(
                    onPressed: () => onIndexSelected(2),
                    icon: Icon(
                      Icons.supervised_user_circle_sharp,
                      color: index == 2
                          ? UcommerceColors.color4
                          : UcommerceColors.color1,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
