import 'package:flutter/material.dart';
import 'package:u_commerce_client_prototype/app/theme.dart';

class DeliveryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;
  const DeliveryButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.padding = const EdgeInsets.all(14.0)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
              //shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(colors: [
                UcommerceColors.color4,
                UcommerceColors.color3,
                UcommerceColors.color4
              ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
          //height: 20,
          child: Padding(
            padding: padding,
            child: Text(
              text,
              style: const TextStyle(color: UcommerceColors.color5),
              textAlign: TextAlign.center,
            ),
          )),
      onTap: onTap,
    );
  }
}
