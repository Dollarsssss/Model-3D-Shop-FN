import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/cart/cart_checkout.dart';
import 'package:flutter_ecommerce/screens/cart/cart_form.dart';
import 'package:flutter_ecommerce/screens/details/add_to_cart.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {

  static String routeName = "/cart";

  const Cart({super.key,});
  

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartAdd>(context);
    var numberItem = cart.items.length;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "$numberItem items",
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body:const CartForm(),
      bottomNavigationBar: CheckOurCard(),
    );
  }
}

