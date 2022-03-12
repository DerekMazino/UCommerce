import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/features/load_shops/domain/models/tienda_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_shops/domain/repositories/tienda_repository.dart';

class ShopController extends GetxController {
  final TiendaRepository tiendaRepository;

  ShopController({required this.tiendaRepository});

  RxInt indexSelected = 0.obs;
  RxList<TiendaModel> shopList = <TiendaModel>[].obs;
  void updateIndexSelected(int index) {
    indexSelected(index);
  }

  void loadShops() async {
    final result = await tiendaRepository.getTiendas();
    shopList.addAll(result);
  }

  @override
  void onReady() {
    loadShops();
    super.onReady();
  }
}
