import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/models/product.dart';

class CartForm extends StatelessWidget {
  const CartForm({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                  child: Image.asset(products[0].image),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products[0].title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text.rich(TextSpan(
                    text: '\$${products[0].price}',
                    style: TextStyle(color: kPrimaryColor),
                    children: [TextSpan(text: "x${products.length} ")]
                  )
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
