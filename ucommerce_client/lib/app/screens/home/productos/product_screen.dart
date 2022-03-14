import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/features/load_products/domain/models/product_model.dart';
import 'package:u_commerce_client_prototype/app/screens/home/cart/cart_controller.dart';
import 'package:u_commerce_client_prototype/app/screens/home/home_controller.dart';
import 'package:u_commerce_client_prototype/app/theme.dart';

import '../../../widgets/item_product.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Inicio')),
          backgroundColor: UcommerceColors.color1,
        ),
        body: Obx(
          () => controller.productList.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    final ProductoModel product = controller.productList[index];
                    return ItemProduct(
                        producto: product,
                        onTap: () {
                          cartController.add(product);
                        });
                  })
              : const Center(child: CircularProgressIndicator()),
        ));
  }
}
