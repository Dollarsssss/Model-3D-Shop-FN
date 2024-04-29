import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key, required this.icons, required this.press,
  });

  final String icons;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(10),
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Color(0XFFF5F6F9),
          shape:BoxShape.circle,
          ),
        child: SvgPicture.asset(icons),
      ),
    );
  }
}
