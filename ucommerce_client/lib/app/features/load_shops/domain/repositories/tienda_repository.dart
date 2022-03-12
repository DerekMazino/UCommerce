import 'package:u_commerce_client_prototype/app/features/load_shops/domain/models/tienda_model.dart';

abstract class TiendaRepository {
  Future<List<TiendaModel>> getTiendas();
}
