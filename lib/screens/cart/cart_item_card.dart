import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/models/newproduct.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartItemCard extends StatefulWidget {
  const CartItemCard(
      {super.key, required this.newproduct, required this.totalprice});

  final NewProduct newproduct;
  final double totalprice;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class AllProducts extends ChangeNotifier {
  List<dynamic> _allProducts = [];

  List<dynamic> get allProducts => _allProducts;

  void setnewProduct(NewProduct allProducts) {
    if (!_allProducts.any((product) => product.id == allProducts.id)) {
      _allProducts.add(allProducts);
      notifyListeners();
    }
  }
    void removeAllProduct(int index) {
    _allProducts.removeAt(index);
    notifyListeners();
  }
}

class _CartItemCardState extends State<CartItemCard> {
  var allProducts;

  @override
  void initState() {
    super.initState();
    allProducts = Provider.of<AllProducts>(context, listen: false);
    Future.microtask(() => allProducts.setnewProduct(widget.newproduct));
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(widget.newproduct.image),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.newproduct.title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(TextSpan(
                text: '\$${widget.totalprice.toStringAsFixed(2)}',
                style: const TextStyle(color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: "  x${widget.newproduct.numberItem}",
                      style: const TextStyle(color: Colors.black))
                ]))
          ],
        )
      ],
    );
  }
}
