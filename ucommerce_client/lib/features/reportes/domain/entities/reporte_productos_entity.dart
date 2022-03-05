import 'package:equatable/equatable.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/tienda_entity.dart';

class ReporteTiendas extends Equatable {
  ReporteTiendas({
    required this.tiendas,
  });

  List<TiendaR> tiendas;

  @override
  List<Object?> get props => [tiendas];
}
