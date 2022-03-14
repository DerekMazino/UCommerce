import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_commerce_client_prototype/app/features/buy/domain/models/product_cart_model.dart';
import 'package:u_commerce_client_prototype/app/screens/home/cart/cart_controller.dart';
import 'package:u_commerce_client_prototype/app/theme.dart';

import '../../../widgets/delivery_button.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({Key? key, this.onShoppingg}) : super(key: key);
  final VoidCallback? onShoppingg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: UcommerceColors.color1,
          title: const Center(
            child: Text(
              'Carrito de Compras',
            ),
          ),
        ),
        body: Obx(() => controller.totalItems.value == 0
            ? _EmptyCart(
                onShoppingg: onShoppingg,
              )
            : _FullCart()));
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  final ProductCartModel productCart;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const _ShoppingCartProduct(
      {Key? key,
      required this.productCart,
      required this.onDelete,
      required this.onIncrement,
      required this.onDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).canvasColor,
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 2,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                              child: Image.network(
                            productCart.product.imagen,
                            fit: BoxFit.cover,
                          )))),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(productCart.product.nombre),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          productCart.product.descripcion,
                          style: Theme.of(context)
                              .textTheme
                              .overline!
                              .copyWith(color: UcommerceColors.color2),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: onDecrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: UcommerceColors.color5,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(productCart.quantity.toString())),
                              InkWell(
                                onTap: onIncrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: UcommerceColors.color4,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Icon(
                                    Icons.add,
                                    color: UcommerceColors.color5,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '\$${productCart.product.precio}',
                                style: TextStyle(color: UcommerceColors.color2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: 0,
              child: InkWell(
                child: CircleAvatar(
                  backgroundColor: UcommerceColors.color3,
                  child: Icon(Icons.delete_outline),
                ),
                onTap: onDelete,
              )),
        ],
      ),
    );
  }
}

class _FullCart extends GetWidget<CartController> {
  @override
  Widget build(BuildContext context) {
    var accentColor2 = Theme.of(context).accentColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.cartList.length,
                    scrollDirection: Axis.horizontal,
                    itemExtent: 230,
                    itemBuilder: (context, index) {
                      final product = controller.cartList[index];
                      return _ShoppingCartProduct(
                          productCart: product,
                          onDelete: () {
                            controller.deleteProduct(product);
                          },
                          onIncrement: () {
                            controller.increment(product);
                          },
                          onDecrement: () {
                            controller.remove(product);
                          });
                    }),
              ),
            )),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Theme.of(context).canvasColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SubTotal',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: accentColor2),
                          ),
                          Obx(
                            () => Text(
                              '\$${controller.totalPrice.value.toStringAsFixed(2)} co',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: accentColor2),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Domicilio',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: accentColor2),
                          ),
                          Text(
                            'Free',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: accentColor2),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:',
                              style: TextStyle(
                                  color: accentColor2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Obx(
                            () => Text(
                              '\$${controller.totalPrice.value.toStringAsFixed(2)} co',
                              style: TextStyle(
                                  color: accentColor2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      DeliveryButton(
                          onTap: controller.shopping, text: 'Comprar')
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

class _EmptyCart extends StatelessWidget {
  final VoidCallback? onShoppingg;
  const _EmptyCart({
    Key? key,
    this.onShoppingg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/sad.png',
          color: UcommerceColors.color1,
          height: 90,
        ),
        const SizedBox(
          height: 20,
        ),
        Text('No has agregado productos al carrito',
            style: TextStyle(color: Theme.of(context).accentColor),
            textAlign: TextAlign.center),
        const SizedBox(
          height: 20,
        ),
        Center(
            // ignore: deprecated_member_use
            child: RaisedButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(
              'Ir a comprar',
              style: TextStyle(color: UcommerceColors.color5),
            ),
          ),
          onPressed: onShoppingg,
          color: UcommerceColors.color4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ))
      ],
    );
  }
}
