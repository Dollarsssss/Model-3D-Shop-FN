import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/screens/order/order_screen.dart';

class PaymentButton extends StatefulWidget {
  const PaymentButton({
    super.key,
  });

  @override
  State<PaymentButton> createState() => _PaymentButtonState();

}


  class _PaymentButtonState extends State<PaymentButton> {
  @override
  Widget build(BuildContext context) {


    return Container(
      padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),
      topRight: Radius.circular(30)),
      boxShadow: [BoxShadow(offset: const Offset(0, -15),
      blurRadius: 20,
      color:const Color(0xFFDADADA).withOpacity(0.15)
      )]),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              const SizedBox( height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(
                    width: 220,
                    child: DefaultButton(
                      text: "Order Placed",
                      press: (){
                        Navigator.pushNamed(context, Order.routeName);
                      },
                    ),
                    ),
                ],
              ),
              const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}