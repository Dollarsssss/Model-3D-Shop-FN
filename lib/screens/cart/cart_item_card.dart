import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/models/newproduct.dart';


// ignore: must_be_immutable
class CartItemCard extends StatefulWidget  {
      const CartItemCard({
      super.key,
      required this.newproduct, required this.totalprice
  });

  final NewProduct newproduct;
  final double totalprice;

  
  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {

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
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(widget.newproduct.image),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.newproduct.title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: '\$${widget.totalprice.toStringAsFixed(2)}',
                style:const TextStyle(color: kPrimaryColor),
                children:[
                  TextSpan(text: "  x${widget.newproduct.numberItem}",
                  style: const TextStyle(color: Colors.black))
                  ]
                )
            )
          ],
        )
      ],
    );
  }
}
