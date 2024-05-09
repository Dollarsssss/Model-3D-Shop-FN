import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/bottom_nav.dart';
import 'package:flutter_ecommerce/enums.dart';

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
    String userId = '30002';
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
                return ExpansionTile(
                  title: Text(
                      'Invoice ID: ${invoice.data?[index]['invoice_id']}\nPayment via : ${invoice.data?[index]['payment']} '),
                  subtitle: Text('Date: ${invoice.data?[index]['date']}'),
                  children: List<Widget>.generate(
                    invoice.data?[index]['details'].length,
                    (detailIndex) => ListTile(
                      title: Text(
                          'Product Name: ${invoice.data?[index]['details'][detailIndex]['product_name']}'),
                      subtitle: Text(
                          'Total Price: ${invoice.data?[index]['details'][detailIndex]['total_price']}'),
                    ),
                  )
                    ..add(
                      ListTile(
                        title: Text('Total Invoice Price: $totalInvoicePrice'),
                        subtitle: Text("Address : ${invoice.data?[index]['address']}"),
                      ),
                    ),
                );
              },
            );
          } else if (invoice.hasError) {
            return Text('${invoice.error}');
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
