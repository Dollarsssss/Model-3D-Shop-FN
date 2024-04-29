import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/screens/details/details.screen.dart';
import 'package:flutter_ecommerce/screens/home/card_item.dart';
import 'package:flutter_ecommerce/screens/home/categories.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Model",
            style: TextStyle(
              fontSize: 30.0, // ขนาดของตัวอักษร
              fontWeight: FontWeight.bold, // ความหนาของตัวอักษร
              // คุณสามารถเพิ่มคุณสมบัติอื่น ๆ ที่คุณต้องการได้ที่นี่
            ),
          ),
        ),
        const Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75
              ),
              itemBuilder: (context,index)=> 
              ItemCard(
                product: products[index],
                press: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>Detail(product: products[index]))))
            ),
          ))
      ],
    );
  }
}

