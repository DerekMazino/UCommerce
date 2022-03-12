import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:u_commerce_client_prototype/app/features/load_shops/domain/models/lista_tiendas_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_shops/domain/models/tienda_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_shops/domain/repositories/tienda_repository.dart';

class TiendaRepositoryImpl extends TiendaRepository {
  final List<TiendaModel> shops = [];
  @override
  Future<List<TiendaModel>> getTiendas() async {
    final resp = await http
        .get(Uri.parse('https://u-commerce-server.herokuapp.com/api/tiendas'));
    final Map<String, dynamic> tiendasMap = json.decode(resp.body);
    //print("Prueba!!! ${productsMap['productos']}");
    List<TiendaModel> prueba = ListaTiendasModel.fromMap(tiendasMap).tiendas;
    shops.addAll(prueba);

    return shops;
  }
}
