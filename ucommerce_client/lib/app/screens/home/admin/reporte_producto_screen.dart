import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_product_model.dart';
import 'package:u_commerce_client_prototype/app/screens/home/admin/admin_controller.dart';
import 'package:u_commerce_client_prototype/app/theme.dart';
import 'package:u_commerce_client_prototype/app/widgets/item_reporte_producto.dart';

class ReporteProductoScreen extends GetWidget<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UcommerceColors.color1,
        title: const Center(
          child: Text(
            'REPORTE! Producto',
          ),
        ),
      ),
      body: Obx(
        () => controller.productList.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final ReporteProductoModel product =
                      controller.productList[index];
                  return ItemReporteProduct(
                    producto: product,
                  );
                })
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
