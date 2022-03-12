import 'package:u_commerce_client_prototype/app/features/buy/domain/models/request/detalle_venta_request.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/models/request/venta_request.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/models/response/venta_response.dart';

abstract class VentaRepository {
  Future<VentaResponse> postVenta(VentaRequest ventaRequest);
  Future<void> postDetalleVenta(DetalleVentaRequest detalleVentaRequest);
}
