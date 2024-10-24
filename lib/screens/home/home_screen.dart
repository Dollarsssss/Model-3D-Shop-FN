import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/bottom_nav.dart';
import 'package:flutter_ecommerce/enums.dart';
import 'package:flutter_ecommerce/models/user.dart';
import 'package:flutter_ecommerce/screens/cart/cart_screen.dart';
import 'package:flutter_ecommerce/screens/home/home_form.dart';
import 'package:flutter_ecommerce/icon_btn.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    User? user;
    print('this is $user');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        actions:[
          IconBtnWithCounter(
            svgSrc: "assets/icons/cart.svg",
            press: (){
              Navigator.pushNamed(context, Cart.routeName);
            },
            iconColor: 0xFF000000,
          ),
          const SizedBox(width:10)
        ],
      ),
      body: HomeForm(),
      bottomNavigationBar:const BottomNav(selectedMenu: MenuState.home),
    );
  }
}

