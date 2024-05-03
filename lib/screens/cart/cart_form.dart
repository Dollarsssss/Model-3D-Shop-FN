import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/screens/cart/cart_item_card.dart';
import 'package:flutter_svg/svg.dart';

class CartForm extends StatefulWidget {
  const CartForm({super.key,});

  @override
  State<CartForm> createState() => _CartFormState();
}


class _CartFormState extends State<CartForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20 ),
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(products[index].id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [Spacer(), SvgPicture.asset("assets/icons/Trash.svg")],
              ),
            ),
            onDismissed: (direction){
              setState(() {
                products.removeAt(index);
              });
            },
            child: CarrItemCard(products: products[index]),
          ),
        ),
      ),
    );
  }
}

