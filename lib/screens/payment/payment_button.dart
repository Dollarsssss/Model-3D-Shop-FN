import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/models/user.dart';
import 'package:flutter_ecommerce/screens/cart/cart_item_card.dart';
import 'package:flutter_ecommerce/screens/details/add_to_cart.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:flutter_ecommerce/screens/payment/payment_list.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_form.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PaymentButton extends StatefulWidget {
  const PaymentButton({
    super.key,
  
  });


  @override
  State<PaymentButton> createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  int? userId;
  String? date;
  String? payment;
  String? address;
  List<String> productName = [];
  List<double> productPrice = [];
  List<int> productQuantity = [];
  List<double> totalPrice = [];

  @override
  void initState() {
    super.initState();
    Provider.of<SelectedPaymant>(context,listen: false).setClear();
    final allProducts = Provider.of<AllProducts>(context, listen: false);
    allProducts.allProducts.forEach((element) {
      productName.add(element.title);
      productPrice.add(element.price);
      productQuantity.add(element.numberItem);
      totalPrice.add(element.price * element.numberItem);
    });
  }

  Future<void> _createOrder() async {
    final url = Uri.parse('http://192.168.1.9:3000/order');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'invoices': {
        'user_id': userId,
        'date': date,
        'payment': payment,
        'address': address,
      },
      'details': List.generate(
          productName.length,
          (index) => {
                'product_name': productName[index],
                'product_price': productPrice[index],
                'product_quantity': productQuantity[index],
                'total_price': totalPrice[index],
              }),
    });

    final res = await http.post(url, headers: headers, body: body);

    if (res.statusCode == 200) {
      print('Order created successfully.');
    } else {
      print('Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final select = Provider.of<SelectedPaymant>(context);
    final user = Provider.of<UserModel>(context);
    User? users = user.user;
    print(select.selected);
   
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
                    press: () async {
                      if (select.selected.isNotEmpty) {
                        userId = users?.id;
                        DateTime now = DateTime.now();
                        date = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
                        payment = "${select.selected}";
                        address = "${users?.address}";
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm Order'),
                              content: const Text('Check and press submit?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Submit'),
                                  onPressed: () {
                                    _createOrder();
                                    Provider.of<CartAdd>(context, listen: false).clearCart();
                                    Provider.of<AllProducts>(context, listen: false).clearProduct();
                                    Provider.of<SelectedPaymant>(context ,listen: false).setClear();
                                    Navigator.pushReplacementNamed(context, Home.routeName);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Notification'),
                              content:
                                  const Text('Please Select Payment Method.'),
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
