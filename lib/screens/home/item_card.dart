import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/models/product.dart';

class ItemCard extends StatefulWidget {
  final Product product;
  final void Function()? press;

  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ItemCardState createState() => _ItemCardState();
}

int a = 4288189587;
class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(widget.product.color as int),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: widget.product.id,
                child: Image.asset(widget.product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              widget.product.title,
              style: const TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Text(
            "\$${widget.product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
