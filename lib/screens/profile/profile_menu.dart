import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key, required this.text, required this.icon, required this.press,
  });
  
  final String text,icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color.fromARGB(255, 241, 243, 246)
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
            icon,
            width: 22,
            color: kPrimaryColor,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(
              text,
              style: const TextStyle(
              fontSize: 18),)),
            const Icon(Icons.arrow_forward_ios)
          ],
        )
      ),
    );
  }
}
