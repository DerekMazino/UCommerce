import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:ucommerce_client/features/reportes/domain/entities/reporte_tiendas_entity.dart';
import 'package:ucommerce_client/features/reportes/domain/usecases/get_reporte_productos.dart';

part 'reporte_productos_event.dart';
part 'reporte_productos_state.dart';

class ReporteProductosBloc
    extends Bloc<ReporteProductosEvent, ReporteProductosState> {
  final GetReporteProductos getReporteProductos;

  ReporteProductosBloc(this.getReporteProductos)
      : super(ReporteProductosInitial());

  Stream<ReporteProductosState> mapEventToState(
    ReporteProductosEvent event,
  ) async* {
    yield ReporteProductosInitial();
    if (event is GetReport) {
      yield ReporteProductosLoadInProgress();
      final failureOrReport = await getReporteProductos(Params(
          fechaInicio: event.fechaInicio,
          fechaFin: event.fechaFin,
          orden: event.orden));
      yield failureOrReport.fold(
          (failure) => ReporteProductosLoadFailed(failure is ServerFailure
              ? 'No report found'
              : 'No report found in cache'),
          (report) => ReporteProductosLoadFinished(report));
    }
  }
}
