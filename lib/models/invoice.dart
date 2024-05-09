import 'dart:convert';
import 'package:http/http.dart' as http;

class Invoice {
  
  final String email,fname, lname, phone, address,avatar;
  final int id;
  
  Invoice({
    required this.email,
    required this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.address,
    required this.avatar,
  });
}