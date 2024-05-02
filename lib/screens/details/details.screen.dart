import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/screens/details/details.form.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Detail extends StatelessWidget {

  final Product product;

  const Detail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(product.color as int),
      appBar: AppBar(
      backgroundColor: Color(product.color as int),
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      actions:[
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg",color: Colors.white,), onPressed: () {},
            
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg",color: Colors.white,), onPressed: () {},
          ),
          const SizedBox(width:10)
        ],
      ),
      body: DetailForm(product: product),
    );
  }
}