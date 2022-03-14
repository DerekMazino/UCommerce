import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:u_commerce_client_prototype/app/screens/home/admin/admin_controller.dart';
import 'package:u_commerce_client_prototype/app/theme.dart';

class PerfilUsuarioScreen extends GetWidget<AdminController> {
  const PerfilUsuarioScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UcommerceColors.color1,
        title: const Center(
          child: Text(
            'Administrador',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: UcommerceColors.color1),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(radius: 55),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Soy el Admin',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              )
            ],
          )),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Card(
                      color: Theme.of(context).canvasColor,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Reportes',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                const Text('Tipo de Reporte',
                                    style: TextStyle(fontSize: 14)),
                                const Spacer(),
                                _ElegirReporte(controller: controller)
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Consulta',
                                    style: TextStyle(fontSize: 14)),
                                const Spacer(),
                                _TipoConsulta(controller: controller)
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    controller.chooseDateInicio();
                                  },
                                  child: const Text('Fecha Inicio'),
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => Text(
                                        DateFormat("yyyy-MM-dd")
                                            .format(controller
                                                .selectedDateInicio.value)
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.deepPurple),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    controller.chooseDateFin();
                                  },
                                  child: const Text('Fecha Fin'),
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => Text(
                                        DateFormat("yyyy-MM-dd")
                                            .format(controller
                                                .selectedDateFin.value)
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.deepPurple),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Center(
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(
                                  'Generar Reporte',
                                  style:
                                      TextStyle(color: UcommerceColors.color5),
                                ),
                              ),
                              onPressed: controller.realizarConsulta,
                              color: UcommerceColors.color4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ))
        ],
      ),
    );
  }
}

class _ElegirReporte extends StatelessWidget {
  final AdminController controller;

  _ElegirReporte({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        value: controller.selectedReporte.value,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: controller.selectedReporte,
        items: controller.listTypeReporte.map((selectedType) {
          return DropdownMenuItem(
            child: new Text(
              selectedType,
            ),
            value: selectedType,
          );
        }).toList(),
      ),
    );
  }
}

class _TipoConsulta extends StatelessWidget {
  AdminController controller;
  _TipoConsulta({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        value: controller.selectedConsulta.value,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: controller.selectedConsulta,
        items: controller.listTypeConsulta.map((selectedType) {
          return DropdownMenuItem(
            child: new Text(
              selectedType,
            ),
            value: selectedType,
          );
        }).toList(),
      ),
    );
  }
}
