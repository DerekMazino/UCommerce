import 'dart:convert';

import 'package:http/http.dart';
import 'package:ucommerce_client/core/error/exception.dart';
import 'package:ucommerce_client/data/models/models.dart';

abstract class UsuarioRemoteDataSource {
  Future<UsuarioModel> getUsuarios();
  Future<UsuarioModel> getUsuario(int id);
}

class UsuarioRemoteDataSourceImpl implements UsuarioRemoteDataSource {
  final Client? client;

  UsuarioRemoteDataSourceImpl({this.client});

  @override
  Future<UsuarioModel> getUsuarios() {
    // TODO: implement getUsuarios
    throw UnimplementedError();
  }

  @override
  Future<UsuarioModel> getUsuario(int id) async {
    final response = await client!.get(
        Uri.parse('https://u-commerce-server.herokuapp.com/api/usuarios/$id'));
    if (response.statusCode == 200 &&
        !response.body.contains('Usuario not found')) {
      return UsuarioModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
