import 'package:flutter/material.dart';
import 'package:u_commerce_client_prototype/app/features/load_reports/domain/models/reporte_product_model.dart';

class ItemReporteProduct extends StatelessWidget {
  final ReporteProductoModel producto;
  const ItemReporteProduct({Key? key, required this.producto})
      : super(key: key);
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
                    producto.producto,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    producto.descripcion,
                    style: Theme.of(context).textTheme.overline,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${producto.ventasTotales}',
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
