import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reporte_ventas_event.dart';
part 'reporte_ventas_state.dart';

class ReporteVentasBloc extends Bloc<ReporteVentasEvent, ReporteVentasState> {
  ReporteVentasBloc() : super(ReporteVentasInitial()) {
    on<ReporteVentasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
