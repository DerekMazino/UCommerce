import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucommerce_client/core/error/exception.dart';
import 'package:ucommerce_client/features/reportes/data/models/reporte_tiendas_model.dart';

abstract class ReporteTiendasLocalDataSource {
  Future<ReporteTiendasModel> getLastReport();
  Future<void> cacheReport(ReporteTiendasModel reportToCache);
}

const REPORT_CACHE = 'REPORT_CACHE_TIENDAS';

class ReporteTiendasLocalDataSourceImpl
    implements ReporteTiendasLocalDataSource {
  final SharedPreferences? sharedPreferences;

  ReporteTiendasLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheReport(ReporteTiendasModel reportToCache) {
    return sharedPreferences!
        .setString(REPORT_CACHE, json.encode(reportToCache.toJson()));
  }

  @override
  Future<ReporteTiendasModel> getLastReport() {
    final jsonString = sharedPreferences!.getString(REPORT_CACHE);
    if (jsonString != null) {
      var resBody = json.decode(jsonString);
      print(resBody);
      return Future.value(ReporteTiendasModel.fromJson(resBody));
    } else {
      throw CacheException();
    }
  }
}
