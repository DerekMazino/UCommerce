import 'package:flutter/material.dart';
import 'package:u_commerce_client_prototype/app/features/load_products/domain/models/product_model.dart';
import 'package:u_commerce_client_prototype/app/widgets/widgets.dart';

class ItemProduct extends StatelessWidget {
  final ProductoModel producto;
  final VoidCallback onTap;
  const ItemProduct({Key? key, required this.producto, required this.onTap})
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
            Expanded(child: Image.network(producto.imagen)),
            Expanded(
              child: Column(
                children: [
                  Text(
                    producto.nombre,
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
                  Text('\$${producto.precio} co'),
                ],
              ),
            ),
            DeliveryButton(
              onTap: onTap,
              text: "Agregar",
              padding: const EdgeInsets.symmetric(vertical: 4),
            )
          ],
        ),
      ),
    );
  }
}
