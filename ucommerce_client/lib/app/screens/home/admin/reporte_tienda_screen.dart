import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_shop_model.dart';
import 'package:u_commerce_client_prototype/app/screens/home/admin/admin_controller.dart';
import 'package:u_commerce_client_prototype/app/theme.dart';
import 'package:u_commerce_client_prototype/app/widgets/item_reporte_tienda.dart';

class ReporteTiendaScreen extends GetWidget<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UcommerceColors.color1,
        title: const Center(
          child: Text(
            'REPORTE! Tienda!!',
          ),
        ),
      ),
      body: Obx(
        () => controller.shopList.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: controller.shopList.length,
                itemBuilder: (context, index) {
                  final ReporteTiendaModel shop = controller.shopList[index];
                  return ItemReporteShop(
                    shop: shop,
                  );
                })
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
