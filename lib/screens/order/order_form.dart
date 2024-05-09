import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/order/order_list.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_form.dart';
import 'package:provider/provider.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({super.key});

  @override
  State<OrderForm> createState() => _OrderFormState();
}

Future<void> updateAddress(String address ,String email,) async {
  final url = Uri.parse('http://192.168.1.9:3000/update_address');
  final headers = {'Content-Type': 'application/json'};
  
  final body = jsonEncode({
    'address': address,
    'email': email,
  });

  final response = await http.put(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('Address updated successfully');
  } else {
    print('Failed to update Address: ${response.statusCode}');
  }
}

class _OrderFormState extends State<OrderForm> {

final addressController = TextEditingController();
String? user;

  @override
  Widget build(BuildContext context) {
    
    var data =  Provider.of<UserModel>(context, listen: false);
    user = data.user?.email;
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
                  onPressed: () {
                       showDialog(
                    context: context,
                    builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Edit Address'),
                            content: TextField(
                              controller: addressController,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              ),
                            actions: <Widget>[
                                TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                        Navigator.of(context).pop();
                                    },
                                ),
                                TextButton(
                                    child:const Text('Submit'),
                                    onPressed: () {
                                      Provider.of<UserModel>(context, listen: false).setAddress(addressController.text);
                                      updateAddress(addressController.text,user!);
                                      Navigator.of(context).pop();
                                    },
                                ),
                            ],
                        );
                    },
                );
                  },
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
                      Icon(Icons.add_circle_outline,size: 30,color: Colors.black,),
                      SizedBox(width: 20,),
                      Text(
                        "Edit Your Address",
                        style:TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 40,),
            const OrderList(),
          ],
        ),
      )
    ]);
  }
}
