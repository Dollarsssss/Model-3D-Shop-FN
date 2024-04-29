import "package:flutter/material.dart";
import "package:flutter_ecommerce/constants.dart";

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,  required this.text, required this.press
  });
  
  final String text;
  final void Function()? press;
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: kPrimaryColor,
          
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
          ), // แทนที่ด้วยข้อความที่คุณต้องการให้ปรากฏบนปุ่ม
      ),
    );
  }
}