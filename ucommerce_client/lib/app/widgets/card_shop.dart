import 'package:flutter/material.dart';
import 'package:u_commerce_client_prototype/app/features/load_shops/domain/models/tienda_model.dart';

class CardShop extends StatelessWidget {
  final TiendaModel tienda;

  const CardShop({Key? key, required this.tienda}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Image.network(tienda.logo)),
            Expanded(
              child: Column(
                children: [
                  Text(
                    tienda.nombre,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    tienda.descripcion,
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
