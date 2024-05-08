import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/models/user.dart';
import 'package:flutter_ecommerce/screens/cart/cart_item_card.dart';
import 'package:flutter_ecommerce/screens/payment/payment_list.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_form.dart';
import 'package:provider/provider.dart';

class PaymentButton extends StatefulWidget {
  const PaymentButton({
    super.key, required this.alltotal,
  });
    final double alltotal;


  @override
  State<PaymentButton> createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  @override
  Widget build(BuildContext context) {
    final select = Provider.of<SelectedPaymant>(context);
    final allProducts = Provider.of<AllProducts>(context);
    final user = Provider.of<UserModel>(context);
    User? users = user.user;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.15))
          ]),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 220,
                  child: DefaultButton(
                    text: "Order Placed",
                    press: () {
                      if (select.selected.length > 0) {
                        print("${select.selected}");
                        allProducts.allProducts.forEach((element) {
                        print(element.title);
                        print(element.price);
                        print(element.numberItem);
                        print(element.numberItem);
                      });
                      print(widget.alltotal);
                      print("${users?.address}");
                      print("${users?.id}");
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Notification'),
                              content: Text('Please Select Payment Method.'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Close'),
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
