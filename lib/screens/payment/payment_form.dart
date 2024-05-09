import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/payment/payment_list.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
             SizedBox(height: 40,),
             PaymentList()
          ],
        ),
      )
    ]);
  }
}
