import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/enums.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:flutter_ecommerce/screens/invoice/invoice_screen.dart';
import 'package:flutter_ecommerce/screens/profile/profile_screen.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key, required this.selectedMenu,
  });

  final MenuState selectedMenu;
  @override
  Widget build(BuildContext context) {

    final Color inActiveIconColor = Color(0xFFB6B6B6);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
        ),
        boxShadow: [BoxShadow(offset: const Offset(0, -15),
        blurRadius: 20,
        color: const Color.fromARGB(255, 163, 163, 163).withOpacity(0.1)
        )]
      ),
      child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          IconButton(
            icon:SvgPicture.asset("assets/icons/Shop Icon.svg" , height: 23,
            color: MenuState.home == selectedMenu ? kPrimaryColor:inActiveIconColor),
            onPressed:(){
              Navigator.pushNamed(context, Home.routeName);
            },
            ),
          IconButton(
            icon:SvgPicture.asset("assets/icons/Cash.svg", height: 22,
            color: MenuState.invoice == selectedMenu ? kPrimaryColor:inActiveIconColor),
            onPressed:(){
              Navigator.pushNamed(context, Invoice.routeName);
            }
            ),
          IconButton(
            icon:SvgPicture.asset("assets/icons/User Icon.svg", height: 23,
            color: MenuState.profile == selectedMenu ? kPrimaryColor:inActiveIconColor),
            onPressed:(){
              Navigator.pushNamed(context, Profile.routeName);
            }
            )
          ],
        ),
      
      );
  }
}