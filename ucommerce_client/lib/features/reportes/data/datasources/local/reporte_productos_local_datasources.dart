import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucommerce_client/core/error/exception.dart';
import 'package:ucommerce_client/features/reportes/data/models/reporte_productos_model.dart';

abstract class ReporteProductosLocalDataSource {
  Future<ReporteProductosModel> getLastReport();
  Future<void> cacheReport(ReporteProductosModel reportToCache);
}

const REPORT_CACHE = 'REPORT_CACHE_PRODUCTOS';

class ReporteProductosLocalDataSourceImpl
    implements ReporteProductosLocalDataSource {
  final SharedPreferences? sharedPreferences;

  ReporteProductosLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheReport(ReporteProductosModel reportToCache) {
    return sharedPreferences!
        .setString(REPORT_CACHE, json.encode(reportToCache.toJson()));
  }

  @override
  Future<ReporteProductosModel> getLastReport() {
    final jsonString = sharedPreferences!.getString(REPORT_CACHE);
    if (jsonString != null) {
      var resBody = json.decode(jsonString);
      print(resBody);
      return Future.value(ReporteProductosModel.fromJson(resBody));
    } else {
      throw CacheException();
    }
  }
}
