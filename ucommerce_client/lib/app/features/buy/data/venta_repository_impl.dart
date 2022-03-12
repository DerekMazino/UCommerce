import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:u_commerce_client_prototype/app/features/buy/domain/models/response/detalle_venta_response.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/models/response/venta_response.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/models/request/venta_request.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/models/request/detalle_venta_request.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/repositories/venta_repository.dart';

class VentaRepositoryImpl implements VentaRepository {
  bool isSaving = false;
  @override
  Future<void> postDetalleVenta(DetalleVentaRequest detalleVentaRequest) async {
    final DetalleVentaResponse ventaResponse;
    final resp = await http.post(
        Uri.parse('https://u-commerce-server.herokuapp.com/api/detalleventas'),
        body: detalleVentaRequest.toJson(),
        headers: {"Content-type": "application/json"});
    final decodedData = json.decode(resp.body);
    ventaResponse = DetalleVentaResponse.fromMap(decodedData);
    print(ventaResponse);
  }

  @override
  Future<VentaResponse> postVenta(VentaRequest ventaRequest) async {
    final resp = await http.post(
        Uri.parse('https://u-commerce-server.herokuapp.com/api/ventas'),
        body: ventaRequest.toJson(),
        headers: {"Content-type": "application/json"});
    print("PRUEBA =======> ${resp.statusCode}");
    print("PRUEBA =======> ${resp.body}");
    print("PRUEBA =======> ${ventaRequest.toJson()}");

    final decodedData = json.decode(resp.body);
    final VentaResponse ventaResponse;
    ventaResponse = VentaResponse.fromMap(decodedData);
    return ventaResponse;
  }
}
