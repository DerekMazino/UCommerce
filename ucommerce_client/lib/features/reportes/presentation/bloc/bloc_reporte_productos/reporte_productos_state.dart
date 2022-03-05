part of 'reporte_productos_bloc.dart';

abstract class ReporteProductosState extends Equatable {
  const ReporteProductosState();

  @override
  List<Object> get props => [];
}

//Estado inicial
class ReporteProductosInitial extends ReporteProductosState {}

//Cargando reporte
class ReporteProductosLoadInProgress extends ReporteProductosState {}

//Carga completa
class ReporteProductosLoadFinished extends ReporteProductosState {
  final ReporteProductos reporte;

  ReporteProductosLoadFinished(this.reporte);

  @override
  List<Object> get props => [reporte];
}

//Error al cargar
class ReporteProductosLoadFailed extends ReporteProductosState {
  final String message;

  ReporteProductosLoadFailed(this.message);

  @override
  List<Object> get props => [message];
}
