import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucommerce_client/core/error/exception.dart';
import 'package:ucommerce_client/data/models/models.dart';

abstract class UsuarioLocalDataSource {
  Future<UsuarioModel> getLastUsuario();
  Future<void> cacheUsuario(UsuarioModel usuariotoCache);
}

const CACHED_USUARIO = 'CACHED_USUARIO';

class UsuarioLocalDataSourceImpl implements UsuarioLocalDataSource {
  final SharedPreferences? sharedPreferences;

  UsuarioLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheUsuario(UsuarioModel usuariotoCache) {
    return sharedPreferences!
        .setString(CACHED_USUARIO, json.encode(usuariotoCache.toJson()));
  }

  @override
  Future<UsuarioModel> getLastUsuario() {
    final jsonString = sharedPreferences!.getString(CACHED_USUARIO);
    if (jsonString != null) {
      var resBody = json.decode(jsonString);
      print(resBody);
      return Future.value(UsuarioModel.fromJson(resBody));
    } else {
      throw CacheException();
    }
  }
}
