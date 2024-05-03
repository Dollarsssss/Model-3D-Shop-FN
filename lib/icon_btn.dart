import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/cart/cart_screen.dart';
import 'package:flutter_ecommerce/screens/details/add_to_cart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:provider/provider.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key, required this.svgSrc, required this.press, required this.iconColor,
  });

  final String svgSrc;
  final int iconColor;
  
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {

    var cart = Provider.of<CartAdd>(context);
    var numberItem = cart.items.length;
    
    return InkWell(
      onTap:press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle
            ),
            child: IconButton(
              icon: SvgPicture.asset(svgSrc,color: Color(iconColor),), onPressed: () {
                 Navigator.pushNamed(context, Cart.routeName);
              },
            ),
          ),
          if (numberItem != 0)
          Positioned(
            right: 0,
            child: Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(color: Color(0xFFFF4848),
              shape: BoxShape.circle,
              border: Border.all(width: 1.5,color: Colors.white)
              ),
              child: Center(
                child: Text("$numberItem",style: const TextStyle(
                  fontSize: 10,
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                 ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

