import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/screens/shop/shop_controller.dart';

import '../../theme.dart';
import '../../widgets/card_shop.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({Key? key}) : super(key: key);
  final controller = Get.find<ShopController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Inicio')),
          backgroundColor: UcommerceColors.color1,
        ),
        body: Obx(
          () => controller.shopList.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: controller.shopList.length,
                  itemBuilder: (context, index) {
                    return CardShop(
                      tienda: controller.shopList[index],
                    );
                  })
              : const Center(child: CircularProgressIndicator()),
        ));
  }
}
