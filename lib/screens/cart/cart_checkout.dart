import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/screens/cart/cart_form.dart';
import 'package:flutter_ecommerce/screens/order/order_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class CheckOurCard extends StatefulWidget {
  const CheckOurCard({
    super.key,
  });


  @override
  State<CheckOurCard> createState() => _CheckOurCardState();

}

  String voucherCode='';

  class _CheckOurCardState extends State<CheckOurCard> {
  @override
  Widget build(BuildContext context) {
  
    var allItemPrice = Provider.of<AllItemPrice>(context);
    double alltotal = 0;
  
    allItemPrice.totalPrices.forEach((item){
      alltotal += item;
    });

    if (voucherCode == '1234') {
      alltotal -= 100;
    }
    if (allItemPrice.totalPrices.isEmpty){
      alltotal = 0;
      voucherCode="";
    }

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
              Row(
                children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: SvgPicture.asset("assets/icons/receipt.svg"),
                  ),
                  const Spacer(),
                  GestureDetector(
                  onTap: () {
                    final voucherController = TextEditingController();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Enter Voucher Code'),
                          content: TextField(
                            controller: voucherController,
                            decoration: const InputDecoration(hintText: "Enter your voucher code here"),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Submit'),
                              onPressed: () {
                                setState(() {
                                voucherCode = voucherController.text;
                              });
                                Navigator.of(context).pop();
                                  showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Voucher Code Entered'),
                                      content: const Text('You have entered 100.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                    child: const Row(
                      children: <Widget>[
                        Text("Add voucher code"),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox( height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text.rich(TextSpan(
                    text: "Total:\n",
                    children: [TextSpan(text:"\$$alltotal",
                     style: const TextStyle(fontSize: 16 ,color: Colors.black))]
                  )
                  ),
                   SizedBox(
                    width: 190,
                    child: DefaultButton(
                      text: "Check Our",
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