import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:u_commerce_client_prototype/app/core/routes/u_commerce_navigation.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_product_model.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/repositories/load_reports_repository.dart';
import 'dart:io';

import 'package:pdf/widgets.dart' as pw;

import '../../../features/load_reports/domain/models/reporte_shop_model.dart';

class AdminController extends GetxController {
  final LaodReportsRepository laodReportsRepository;
  RxList<ReporteProductoModel> productList = <ReporteProductoModel>[].obs;
  RxList<ReporteTiendaModel> shopList = <ReporteTiendaModel>[].obs;
  bool completo = false;
  var selectedDateInicio = DateTime.now().obs;
  var selectedDateFin = DateTime.now().obs;
  final selectedReporte = "Reporte Tiendas".obs;
  final selectedConsulta = "Más ventas".obs;
  final listTypeReporte = ["Reporte Tiendas", "Reporte Productos"].obs;
  final listTypeConsulta = ["Más ventas", "Menos ventas"].obs;
  AdminController({required this.laodReportsRepository});

  @override
  void onReady() {
    loardReport();
    super.onReady();
  }

  void loardReport() async {
    final resp = await laodReportsRepository.getReportProduct(
        '2022-02-22', '2022-03-10', 'asc');
    print(resp[0].producto);
  }

  void setSelectedReporte(String value) {
    selectedReporte.value = value;
  }

  void setSelectedConsulta(String value) {
    selectedConsulta.value = value;
  }

  chooseDateInicio() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDateInicio.value,
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirmar',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText:
          'Month/Date/Year', /* selectableDayPredicate: disableDate */
    );
    if (pickedDate != null && pickedDate != selectedDateInicio.value) {
      selectedDateInicio.value = pickedDate;
    }
  }

  chooseDateFin() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDateFin.value,
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirmar',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText:
          'Month/Date/Year', /* selectableDayPredicate: disableDate */
    );
    if (pickedDate != null && pickedDate != selectedDateFin.value) {
      selectedDateFin.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  void realizarConsulta() async {
    if (selectedReporte.value == 'Reporte Tiendas') {
      var reporte = await getReporteTienda();
      shopList.clear();
      print('Valor => ${reporte.length}}');
      shopList.addAll(reporte);
      Get.toNamed(UCommerceRoutes.reportsShops);
    } else {
      var reporte = await getReporteProducto();
      productList.clear();
      productList.addAll(reporte);
      Get.toNamed(UCommerceRoutes.reportsProducts);
    }
  }

  Future<List<ReporteTiendaModel>> getReporteTienda() async {
    String fechaInicio = selectedDateInicio.value.toString();
    fechaInicio = fechaInicio.split(' ')[0];
    String fechaFin = selectedDateFin.value.toString();
    fechaFin = fechaFin.split(' ')[0];
    String orden = "asc";
    if (selectedConsulta.value == 'Más ventas') {
      orden = "desc";
    }
    final resp =
        await laodReportsRepository.getReportShop(fechaInicio, fechaFin, orden);
    print('OTRA BANDERA ===> ${resp.length}');
    return resp;
  }

  Future<List<ReporteProductoModel>> getReporteProducto() async {
    String fechaInicio = selectedDateInicio.value.toString();
    fechaInicio = fechaInicio.split(' ')[0];
    String fechaFin = selectedDateFin.value.toString();
    fechaFin = fechaFin.split(' ')[0];
    String orden = "asc";
    if (selectedConsulta.value == 'Más ventas') {
      orden = "desc";
    }
    print('BANDERAAAA!!! ===> $orden');
    final resp = await laodReportsRepository.getReportProduct(
        fechaInicio, fechaFin, orden);
    return resp;
  }
  /* Future<void> generarReporte() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );
    print("entre =>>>>ssdkad");
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    file.writeAsBytesSync(await pdf.save());
  } */
}
