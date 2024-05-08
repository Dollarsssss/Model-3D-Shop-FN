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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          children: [
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        ),
                     side: const BorderSide(color: Color.fromARGB(255, 183, 176, 176)),
                    backgroundColor: Colors.white,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.credit_card_rounded,size: 30,color: Colors.black,),
                      SizedBox(width: 20,),
                      Text(
                        "Add New Card",
                        style:TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 40,),
            const PaymentList()
          ],
        ),
      )
    ]);
  }
}
