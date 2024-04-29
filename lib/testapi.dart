import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  static String routeName = "/get_api";

  @override
  State<StatefulWidget> createState() {
    return _UsersPageState();
  }
}

class _UsersPageState extends State<UsersPage> {
  List<dynamic> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.9:3000/users'));

         setState(() {
      _users = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_users.length);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Aomsup'),
        ),
        body: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            final user = _users[index];
            return ListTile(
              title: Text(user['fname']),
            );
          },
        ));
  }
}

