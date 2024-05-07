import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/order/order_address.dart';
import 'package:flutter_ecommerce/screens/order/order_form.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  static String routeName = "/order";

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
 @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
              "Order Summary",
              style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: OrderForm(),
      bottomNavigationBar: OrderAddress(),
    );
  }
}