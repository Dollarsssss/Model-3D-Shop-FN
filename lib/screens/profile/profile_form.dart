import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/profile/profile_menu.dart';
import 'package:flutter_ecommerce/screens/profile/profile_picture.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProFilePic(),
        const SizedBox(height: 40),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text:"My Account",
          press: (){}
          ),
        const SizedBox(height: 10),
        ProfileMenu(
          icon: "assets/icons/Question mark.svg",
          text:"Help Center",
          press: (){}
          ),
        const SizedBox(height: 10),
        ProfileMenu(
          icon: "assets/icons/Log out.svg",
          text:"Log Out",
          press: (){}
          ),
      ],
    );
  }
}



