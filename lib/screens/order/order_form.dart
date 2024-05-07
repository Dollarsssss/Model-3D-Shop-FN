import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/order/order_list.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({super.key});

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
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
                      Icon(Icons.add_circle_outline,size: 30,color: Colors.black,),
                      SizedBox(width: 20,),
                      Text(
                        "Add New Address",
                        style:TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      
                    ],
                  ),
                ),
              ),
            SizedBox(height: 40,),
            const OrderList()
          ],
        ),
      )
    ]);
  }
}
