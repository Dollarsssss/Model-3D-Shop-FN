import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/bottom_nav.dart';
import 'package:flutter_ecommerce/enums.dart';
import 'package:flutter_ecommerce/screens/profile/profile_form.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  static String routeName = "/profile";
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 25)),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ProfileForm(),
      ),
      bottomNavigationBar: const BottomNav(selectedMenu: MenuState.profile,),
    );
  }
}

