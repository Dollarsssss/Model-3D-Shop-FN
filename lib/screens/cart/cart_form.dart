import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/newproduct.dart';
import 'package:flutter_ecommerce/screens/cart/cart_item_card.dart';
import 'package:flutter_ecommerce/screens/details/add_to_cart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CartForm extends StatefulWidget {
  const CartForm({
    super.key,
  });

  @override
  State<CartForm> createState() => _CartFormState();
}
List<NewProduct> newproducts = [];
List<double> totalPrices = [];

class AllItemPrice extends ChangeNotifier {

  List<double> _allItemPrice = [];
  List<double> get totalPrices => _allItemPrice;

   void addItemPrice(double price) {
    _allItemPrice.add(price);
    notifyListeners();
  }
   void removeItemPrice(int index) {
    _allItemPrice.removeAt(index);
    notifyListeners();
  }
}


class _CartFormState extends State<CartForm> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartAdd>(context);
    var allItemPrice = Provider.of<AllItemPrice>(context);
    var allProducts = Provider.of<AllProducts>(context);

    newproducts.clear();
    totalPrices.clear();
    allItemPrice.totalPrices.clear();
    

    cart.items.forEach((item) {
     
        NewProduct newProduct = NewProduct(
        id: item.product.id.toInt(),
        title: item.product.title.toString(),
        price: item.product.price.toDouble(),
        size: item.product.size.toInt(),
        description: item.product.description.toString(),
        image: item.product.image.toString(),
        color: item.product.color.toInt(),
        quality: item.product.quality.toString(),
        model: item.product.model.toString(),
        numberItem: item.numberItem
      );
      newproducts.add(newProduct);
      totalPrices.add(item.product.price * item.numberItem);
      Future.microtask(() => allItemPrice.addItemPrice(item.product.price * item.numberItem));
      //Future.microtas เลื่อนการทำงานไปจนกว่าการสร้าง widget จะเสร็จสิ้น ไม่งั้นจะทำให้การ render ช้าลง
    
    });
  
   
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: newproducts.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(newproducts[index].id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg")
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                cart.removeItem(newproducts[index].id);
                allItemPrice.removeItemPrice(index);
                allProducts.removeAllProduct(index);
              });
            },
            child: CartItemCard(
              newproduct: newproducts[index],
              totalprice: totalPrices[index],
            ),
          ),
        ),
      ),
    );
  }
}
