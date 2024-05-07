import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

String formatString(String str) {
  String newStr = '';
  while (str.length > 24) {
    newStr += str.substring(0, 24) + '\n';
    str = str.substring(24);
  }
  newStr += str;
  return newStr;
}

class _OrderListState extends State<OrderList> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Column(
        children: [
          Container(
            color: isSelected ? Colors.lightBlue[50] : Colors.transparent,
            child: Stack(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 217, 217, 217)),
                  ),
                  tileColor: const Color.fromARGB(255, 252, 252, 252),
                  title: Padding(
                    padding: EdgeInsets.only(top: 13, bottom: 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.home,
                          size: 40,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("My Home",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: kPrimaryColor)),
                            const Text(
                              "Aomsup Pongpan",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Text("092-874-8794",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              formatString(
                                  '811 Forest Oak RPCH Wat Nawong Suntorlapon'),
                              style: const TextStyle(
                                  fontSize: 13.7,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 90, 90, 90)),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (isSelected) // แสดงปุ่มวงกลมเมื่อ isSelected เป็น true
                  Positioned(
                    right: 15,
                    top: 15,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 2, 30, 122),
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                if (isSelected) 
                Positioned(
                  right: 15,
                  bottom: 15,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.delete),
                      iconSize: 13,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}