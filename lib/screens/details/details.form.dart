import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/screens/details/add_to_cart.dart';
import 'package:flutter_ecommerce/screens/details/description.dart';
import 'package:flutter_ecommerce/screens/details/premium_and_size.dart';
import 'package:flutter_ecommerce/screens/details/product_title_with_image.dart';


class DetailForm extends StatelessWidget {
  const DetailForm({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12, left: 20, right: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(24),
                      )),
                  child: Column(
                    children: [
                      PremiumAndSize(product: product),
                      const SizedBox(height: 10),
                      Description(product: product),
                      //const SizedBox(height: 10),
                      // CartCount(),
                      // const SizedBox(height: 10),
                      AddtoCart(product: product, numberItem: 1)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}


