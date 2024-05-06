// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class CartCount extends StatefulWidget {
//   CartCount({super.key});

//    int numberItem = 1;
  

//   @override
//   State<CartCount> createState() => _CartCountState();
  
// }

// class _CartCountState extends State<CartCount> {
//   @override
//   Widget build(BuildContext context) {
    
//     return Row(
//       children: [
//         buildOutlineButton(icon: Icons.remove,press: (){
//           setState(() {
//             if(widget.numberItem > 1){
//               widget.numberItem--;
//                 print(widget.numberItem);
//             }
//           });
//         }),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Text(widget.numberItem.toString().padLeft(2,"0"),style: const TextStyle(fontSize: 28),),
//         ),
//         buildOutlineButton(icon: Icons.add,press: (){
//           setState(() {
//             widget.numberItem++;
//             print(widget.numberItem);
//           });
//         }),
//       ],
//     );
//   }

//   SizedBox buildOutlineButton({required IconData icon, required void Function()? press}) {
//     return SizedBox(
//         width: 40,
//         height: 32,
//         child: OutlinedButton(
//            style: OutlinedButton.styleFrom(
//             padding: EdgeInsets.zero,
//           ),
//           onPressed: press,
//           child: Icon(icon),
//         ),
//       );
//   }
// }