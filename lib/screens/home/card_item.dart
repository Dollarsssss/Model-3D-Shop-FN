import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/models/product.dart';

class ItemCard extends StatelessWidget {

  final Product product;
  final void Function()?  press;

  const ItemCard({
    super.key,  required this.product,  required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16)
              ),
              child: Hero(
                tag:product.id,
                child: Image.asset(product.image)
                ) ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              product.title,
              style: const TextStyle(
                color:kTextLightColor 
                ),
            ),
          ),
          Text("\$${product.price}",style: const TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}


