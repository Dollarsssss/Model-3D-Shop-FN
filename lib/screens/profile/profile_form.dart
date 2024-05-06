import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/profile/profile_menu.dart';
import 'package:flutter_ecommerce/screens/profile/profile_picture.dart';
import 'package:flutter_ecommerce/screens/profile_update/profile_update_screen.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_screen.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {


  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        ProFilePic(),
        const SizedBox(height: 40),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text:"My Account",
          press: (){
            Navigator.pushNamed(context, ProfileUpdate.routeName);
          }
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
          press: (){
                    showDialog(
                    context: context,
                    builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text('Confirm to log out'),
                            content: Text('Do you want to logout?'),
                            actions: <Widget>[
                                TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                        Navigator.of(context).pop();
                                    },
                                ),
                                TextButton(
                                    child: Text('Submit'),
                                    onPressed: () {
                                        Navigator.pushNamed(context, SignIn.routeName);
                                    },
                                ),
                            ],
                        );
                    },
                );
            },
                    
          ),
      ],
    );
  }
}



