import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';


class PremiumAndSize extends StatelessWidget {
  const PremiumAndSize({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
          child: RichText(text: TextSpan(
            style: const TextStyle(color:Colors.black),
            children: [
            const TextSpan(text: "Premium Quality\n"),
            TextSpan(text: "${product.quality }",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
          ])),
        ),
        Expanded(
          child: RichText(text: TextSpan(
            style: const TextStyle(color:Colors.black),
            children: [
            const TextSpan(text: "Size\n"),
            TextSpan(text: "${product.size } cm",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
          ])),
        )
      ],
    );
  }
}