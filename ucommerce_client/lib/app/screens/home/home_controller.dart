import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/features/load_products/domain/models/product_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_products/domain/repositories/producto_repositorio.dart';

class HomeController extends GetxController {
  final ProductoRepository productoRepository;

  HomeController({required this.productoRepository});

  RxInt indexSelected = 0.obs;
  RxList<ProductoModel> productList = <ProductoModel>[].obs;
  void updateIndexSelected(int index) {
    indexSelected(index);
  }

  void loadProducts() async {
    final result = await productoRepository.getProducts();
    productList.addAll(result);
  }

  @override
  void onReady() {
    loadProducts();
    super.onReady();
  }
}
