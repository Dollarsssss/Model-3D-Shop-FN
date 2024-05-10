import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/screens/details/details.screen.dart';
import 'package:flutter_ecommerce/screens/home/item_card.dart';

class CategoryView extends StatelessWidget {
  final String category;

  const CategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts;
    if (category == 'All') {
      // แสดงสินค้าทั้งหมด
      filteredProducts = products;
    } else {
      // กรองสินค้าตามคุณภาพ
      filteredProducts = products.where((product) => product.quality == category).toList();
    }
    return buildProductGridView(filteredProducts);
  }

  Widget buildProductGridView(List<Product> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75
      ),
      itemBuilder: (context, index) => ItemCard(
        product: products[index],
        press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(product: products[index])))
      ),
    );
  }
}