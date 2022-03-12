import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/models/request/detalle_venta_request.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/models/request/venta_request.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/repositories/venta_repository.dart';
import 'package:u_commerce_client_prototype/app/features/load_products/domain/models/product_model.dart';

import '../../../features/buy/domain/models/product_cart_model.dart';

class CartController extends GetxController {
  final VentaRepository ventaRepository;
  RxList<ProductCartModel> cartList = <ProductCartModel>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  CartController({required this.ventaRepository});

  void add(ProductoModel product) {
    final List<ProductCartModel> temp = List.from(cartList);
    bool found = false;
    for (ProductCartModel p in temp) {
      if (p.product.nombre == product.nombre) {
        p.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      temp.add(ProductCartModel(product: product));
    }
    cartList.value = List<ProductCartModel>.from(temp);
    calculateTotals(temp);
  }

  void increment(ProductCartModel productCartModel) {
    productCartModel.quantity += 1;
    cartList.value = List<ProductCartModel>.from(cartList);
    calculateTotals(cartList);
  }

  void remove(ProductCartModel productCartModel) {
    if (productCartModel.quantity > 1) {
      productCartModel.quantity -= 1;
      cartList.value = List<ProductCartModel>.from(cartList);
      calculateTotals(cartList);
    }
  }

  void calculateTotals(List<ProductCartModel> temp) {
    final int total = temp.fold(
        0, (previousValue, element) => element.quantity + previousValue);
    totalItems(total);
    final double totalCost = temp.fold(
        0.0,
        (previousValue, element) =>
            (element.quantity * element.product.precio) + previousValue);
    totalPrice(totalCost);
  }

  void deleteProduct(ProductCartModel productCartModel) {
    cartList.remove(productCartModel);
    cartList.value = List<ProductCartModel>.from(cartList);
    calculateTotals(cartList);
  }

  void shopping() async {
    VentaRequest venta = VentaRequest(7, 4, totalPrice.toInt());
    final result = await ventaRepository.postVenta(venta);
    print('Venta: => $result');
    crearDetalles(result.idVenta);
    cartList.clear();
    calculateTotals(cartList);
  }

  void crearDetalles(int idVenta) async {
    final List<ProductCartModel> temp = List.from(cartList);
    for (ProductCartModel p in temp) {
      DetalleVentaRequest dt = DetalleVentaRequest(
          idVenta, p.product.idProducto, p.product.precio, p.quantity);
      final result = await ventaRepository.postDetalleVenta(dt);
    }
  }
}
