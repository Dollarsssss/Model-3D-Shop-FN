import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/cart/cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ecommerce/constants.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key, required this.svgSrc, required this.numOfItem, required this.press, required this.iconColor,
  });

  final String svgSrc;
  final int numOfItem,iconColor;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
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
                child: Text("$numOfItem",style: const TextStyle(
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

