import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/screens/cart/cart_screen.dart';
import 'package:flutter_svg/svg.dart';

class AddtoCart extends StatefulWidget {
  const AddtoCart({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}


class _AddtoCartState extends State<AddtoCart> {
  int numberItem = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              buildOutlineButton(
                  icon: Icons.remove,
                  press: () {
                    setState(() {
                      if (numberItem > 1) {
                        numberItem--;
                        print(numberItem);
                      }
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  numberItem.toString().padLeft(2, "0"),
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              buildOutlineButton(
                  icon: Icons.add,
                  press: () {
                    setState(() {
                      numberItem++;
                      print(numberItem);
                    });
                  }),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 50,
                width: 58,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Color(widget.product.color))),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/add_to_cart.svg",
                    color: Color(widget.product.color),
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      backgroundColor: Color(widget.product.color),
                    ),
                    onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Cart(
                            product: products,
                          )
                        )
                    );
                    },
                    child: Text(
                      "Buy Now".toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

SizedBox buildOutlineButton(
    {required IconData icon, required void Function()? press}) {
  return SizedBox(
    width: 40,
    height: 32,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: press,
      child: Icon(icon),
    ),
  );
}
