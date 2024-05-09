import 'dart:convert';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/models/user.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_form.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/bottom_nav.dart';
import 'package:flutter_ecommerce/enums.dart';
import 'package:provider/provider.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  static String routeName = "/invoice";

  @override
  State<Invoice> createState() => _InvoiceState();
}

Future<List<dynamic>> fetchInvoices(String userId) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.9:3000/invoices'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user_id': userId,
    }),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
    
  } else {
    throw Exception('Failed to load invoices');
  }
}

class _InvoiceState extends State<Invoice> {
  late Future<List<dynamic>> futureInvoices;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserModel>(context, listen: false);
    User? users = user.user;
    String userId = '${users?.id.toString()}';
    futureInvoices = fetchInvoices(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Invoice",
            style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 25)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: futureInvoices,
        builder: (context, invoice) {
          if (invoice.hasData) {
            return ListView.builder(
              itemCount: invoice.data?.length,
              itemBuilder: (context, index) {
                var totalInvoicePrice = 0.0;
                for (var detail in invoice.data?[index]['details']) {
                  totalInvoicePrice += num.parse(detail['total_price']);
                }
                return Card(
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text(
                          'Invoice ID: ${invoice.data?[index]['invoice_id']}\nPayment via : ${invoice.data?[index]['payment']} ' ,style: const TextStyle(color: Colors.white ,fontSize: 20),),
                      subtitle: Text('Date: ${invoice.data?[index]['date']}',style: const TextStyle(color: Colors.white, fontSize: 16)),
                      children: List<Widget>.generate(
                        invoice.data?[index]['details'].length,
                        (detailIndex) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Card(
                            child: ListTile(
                              title: Text(
                                  'Name : ${invoice.data?[index]['details'][detailIndex]['product_name']}',style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 17),),
                              subtitle: Text(
                                  'Price : ${invoice.data?[index]['details'][detailIndex]['product_price']}   x${invoice.data?[index]['details'][detailIndex]['product_quantity']}'),
                            ),
                          ),
                        ),
                      )
                        ..add(
                          ListTile(
                            title: Text('Total Invoice Price: ${totalInvoicePrice.toStringAsFixed(2)}',style: const TextStyle(color: Colors.white, fontSize: 20)),
                            subtitle: Text("Address : ${invoice.data?[index]['address']}",style: const TextStyle(color: Colors.white,fontSize: 16)),
                          ),
                        ),
                    ),
                  ),
                );
              },
            );
          } else if (invoice.hasError) {
            return Text('');
          }
          return const CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: const BottomNav(
        selectedMenu: MenuState.invoice,
      ),
    );
  }
}
