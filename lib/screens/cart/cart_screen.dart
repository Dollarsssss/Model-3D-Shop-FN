import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
//import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/screens/cart/cart_form.dart';

class Cart extends StatefulWidget {

  static String routeName = "/cart";
  
  
  const Cart({super.key,});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "3 items",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: CartForm(),
    );
  }
}