import 'package:equatable/equatable.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/producto_entity.dart';

class ReporteProductos extends Equatable {
  ReporteProductos({
    required this.productos,
  });

  List<ProductoR> productos;

  @override
  List<Object?> get props => [productos];
}
