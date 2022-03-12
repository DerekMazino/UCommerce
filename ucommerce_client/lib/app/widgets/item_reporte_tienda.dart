import 'package:flutter/material.dart';

import '../features/load_reports/domain/models/reporte_shop_model.dart';

class ItemReporteShop extends StatelessWidget {
  final ReporteTiendaModel shop;
  const ItemReporteShop({Key? key, required this.shop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    shop.nombre,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    shop.descripcion,
                    style: Theme.of(context).textTheme.overline,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${shop.ventasTotales}',
                    style: Theme.of(context).textTheme.overline,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
