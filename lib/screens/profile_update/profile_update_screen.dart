import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/profile_update/profile_update_form.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

    static String routeName = '/profile_update';

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 25)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ProfileUpdateForm(),
      ), 
    );    
  }

}