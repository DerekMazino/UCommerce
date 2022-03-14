import 'dart:convert';

class DetalleVentaRequest {
  final int ventaId;
  final int productoId;
  final int precioUnitario;
  final int cantidad;

  DetalleVentaRequest(
      this.ventaId, this.productoId, this.precioUnitario, this.cantidad);
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "venta_id": ventaId,
        "producto_id": productoId,
        "precio_unitario": precioUnitario,
        "cantidad": cantidad,
      };
}
