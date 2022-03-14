import 'dart:convert';

class VentaRequest {
  final int tiendaId;
  final int clienteId;
  final int totalPagar;
  VentaRequest(this.tiendaId, this.clienteId, this.totalPagar);

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "tienda_id": tiendaId,
        "cliente_id": clienteId,
        "total_pagar": totalPagar,
      };
}
