import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/order/order_screen.dart';
import 'package:flutter_ecommerce/screens/payment/payment_button.dart';
import 'package:flutter_ecommerce/screens/payment/payment_form.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  static String routeName = "/paymant";

  @override
  State<Payment> createState() => _PaymentState();
  
}

class _PaymentState extends State<Payment> {
  
 @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text( "Payment",
        style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, Order.routeName),
        ),
      ),
      body: const SingleChildScrollView(child: PaymentForm()),
      bottomNavigationBar: const PaymentButton(),
    );
  }
}