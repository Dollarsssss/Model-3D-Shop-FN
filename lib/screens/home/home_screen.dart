import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/bottom_nav.dart';
import 'package:flutter_ecommerce/enums.dart';
import 'package:flutter_ecommerce/screens/home/home_form.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions:[
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg",color: Colors.black,), onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg",color: Colors.black,), onPressed: () {},
          ),
          const SizedBox(width:10)
        ],
      ),
      body: const Padding(
        padding:EdgeInsets.only(bottom: 20),
        child: HomeForm(),
      ),
      bottomNavigationBar:const BottomNav(selectedMenu: MenuState.home),
    );
  }
}

