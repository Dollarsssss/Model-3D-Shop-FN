import 'package:flutter_ecommerce/models/product.dart';

class Carts {
  final Product product;
  final int numOfItem;

  Carts({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Carts> demoCarts = [
  Carts(product: products[0], numOfItem: 2),
  Carts(product: products[1], numOfItem: 1),
  Carts(product: products[3], numOfItem: 1),
];