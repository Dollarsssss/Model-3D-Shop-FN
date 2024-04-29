import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    super.key,
    required this.product,
  });

  final Product product;

  

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Aristocratic Hang Bag",
              style: TextStyle(color: Colors.white)),
          Text(
            product.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: Colors.white),
          ),
         const SizedBox(height: 15),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(text: "Price\n"),
                TextSpan(
                    text: "\$${product.price}", 
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Colors.white
                    )
                  )
              ]
            )
            ),
            SizedBox(width: 20),
              Expanded(child: 
                SizedBox(
                  width: 300,
                  height: 280,
                  child: Hero(
                    tag: product.id,
                    child: ModelViewer(
                      src:product.model,
                      ar: true,
                      autoRotate: true,
                      cameraControls: true,
                    
                      ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
