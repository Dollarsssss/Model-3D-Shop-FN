import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/profile/profile_form.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 25)),
        centerTitle: true,
      ),
      body: const ProfileForm(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          ),
          boxShadow: [BoxShadow(offset: Offset(0, -15),
          blurRadius: 20,
          color: Color(0xFFDADADA).withOpacity(0.15)
          )]
        ),
        child: SafeArea(
          child: Row(
            children: [
          
            ],
          ),
        ),
        ),
    );
  }
}