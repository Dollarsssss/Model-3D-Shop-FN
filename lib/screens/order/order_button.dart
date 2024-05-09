import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/screens/order/order_list.dart';
import 'package:flutter_ecommerce/screens/payment/payment_screen.dart';
import 'package:provider/provider.dart';

class OrderButton extends StatefulWidget {
  const OrderButton({
    super.key, 
  });

  @override
  State<OrderButton> createState() => _OrderButtonState();

}
  class _OrderButtonState extends State<OrderButton> {
  @override
  Widget build(BuildContext context) {

   var select =Provider.of<SelectedAddress>(context);
 
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
                      text: "Paymant",
                      press: (){
                        if(select.selected == true){
                        Navigator.pushNamed(context, Payment.routeName);
                        }else{
                           print(select.selected);
                          showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Notification'),
                              content: const Text('Please Select Address.'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        }
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