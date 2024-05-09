import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/screens/cart/cart_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddtoCart extends StatefulWidget {

  final Product product;
  var numberItem;

    AddtoCart({
    super.key,
    required this.product, 
    required this.numberItem
  });

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}


class CartAdd with ChangeNotifier {

  final List<AddtoCart> _items = [];

  List<AddtoCart> get items => _items;


  void addItem(BuildContext context,Product product, int numberItem) {

    for (var item in _items) {
      if (item.product.id == product.id) {
            showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('This product is already in the cart'),
            content: const Text('You cannot add products that are already in the cart'),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
        return;
      }
  }
    _items.add(AddtoCart(product: product, numberItem: numberItem));
    notifyListeners();
  }

  void buyNow(BuildContext context,Product product, int numberItem) {

    for (var item in _items) {
      if (item.product.id == product.id) {
            showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('This product is already in the cart.'),
            content: const Text('You cannot add products that are already in the cart'),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
        return;
      }
  }
    _items.add(AddtoCart(product: product, numberItem: numberItem));
    Navigator.pushReplacementNamed(context, Cart.routeName);
    notifyListeners();
  }
    void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

    void clearCart() {
    _items.clear();
    notifyListeners();
  }

}

class _AddtoCartState extends State<AddtoCart> {
 

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              buildOutlineButton(
                  icon: Icons.remove,
                  press: () {
                    setState(() {
                      if (widget.numberItem > 1) {
                        widget.numberItem --;
                      }
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.numberItem .toString().padLeft(2, "0"),
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              buildOutlineButton(
                  icon: Icons.add,
                  press: () {
                    setState(() {
                      widget.numberItem ++;
                    });
                  }),
            ],
          ),
          const SizedBox( height: 35 ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 50,
                width: 58,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Color(widget.product.color))),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/add_to_cart.svg",
                    color: Color(widget.product.color),
                  ),
                  onPressed: () {
                  Provider.of<CartAdd>(context, listen: false).addItem(context,widget.product, widget.numberItem);
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      backgroundColor: Color(widget.product.color),
                    ),
                    onPressed: () {
                       Provider.of<CartAdd>(context, listen: false).buyNow(context,widget.product,widget.numberItem);
                    },
                    child: Text(
                      "Buy Now".toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

SizedBox buildOutlineButton(
    {required IconData icon, required void Function()? press}) {
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
