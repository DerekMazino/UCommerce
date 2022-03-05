part of 'reporte_productos_bloc.dart';

abstract class ReporteProductosEvent extends Equatable {
  const ReporteProductosEvent();

  @override
  List<Object> get props => [];
}

class GetReport extends ReporteProductosEvent {
  final String fechaInicio;
  final String fechaFin;
  final String orden;

  GetReport(this.fechaInicio, this.fechaFin, this.orden);

  @override
  List<Object> get props => [fechaInicio, fechaFin, orden];
}
