import 'dart:convert';

import 'package:u_commerce_client_prototype/app/features/load_shops/domain/models/tienda_model.dart';

class ListaTiendasModel {
  ListaTiendasModel({
    required this.tiendas,
  });

  List<TiendaModel> tiendas;

  factory ListaTiendasModel.fromJson(String str) =>
      ListaTiendasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListaTiendasModel.fromMap(Map<String, dynamic> json) =>
      ListaTiendasModel(
        tiendas: List<TiendaModel>.from(
            json["tiendas"].map((x) => TiendaModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tiendas": List<dynamic>.from(tiendas.map((x) => x.toMap())),
      };
}
