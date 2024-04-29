import 'package:flutter/material.dart';

class CartCount extends StatefulWidget {
  const CartCount({super.key});

  @override
  State<CartCount> createState() => _CartCountState();
}

  int numberItem = 1;

class _CartCountState extends State<CartCount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(icon: Icons.remove,press: (){
          setState(() {
            if(numberItem > 1){
              numberItem--;
            }
          });
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(numberItem.toString().padLeft(2,"0"),style: TextStyle(fontSize: 28),),
        ),
        buildOutlineButton(icon: Icons.add,press: (){
          setState(() {
            numberItem++;
          });
        }),
      ],
    );
  }

  SizedBox buildOutlineButton({required IconData icon, required void Function()? press}) {
    return SizedBox(
        width: 40,
        height: 32,
        child: OutlinedButton(
           style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: press,
          child: Icon(icon),
        ),
      );
  }
}