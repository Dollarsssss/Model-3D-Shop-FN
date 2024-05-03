import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/models/product.dart';

class CarrItemCard extends StatelessWidget {
  const CarrItemCard({
    super.key,
    required this.products,
  });

  final Product products;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(products.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              products.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(TextSpan(
                text: '\$${products.price}',
                style: TextStyle(color: kPrimaryColor),
                children: [TextSpan(text: "xNumberOfItem ")]))
          ],
        )
      ],
    );
  }
}
