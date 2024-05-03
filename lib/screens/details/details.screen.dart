import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/screens/cart/cart_screen.dart';
import 'package:flutter_ecommerce/screens/details/details.form.dart';
import 'package:flutter_ecommerce/icon_btn.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Detail extends StatelessWidget {

  final Product product;

  const Detail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(product.color),
      appBar: AppBar(
      backgroundColor: Color(product.color),
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      actions:[
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg",color: Colors.white,), onPressed: () {},
            
          ),
           IconBtnWithCounter(
            svgSrc: "assets/icons/cart.svg",
            press: (){
              Navigator.pushNamed(context, Cart.routeName);
            },
            iconColor: 0xFFFFFFFF,
          ),
          const SizedBox(width:10)
        ],
      ),
      body: DetailForm(product: product),
    );
  }
}