import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../components/custom_suffix.icon.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({super.key});

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class SelectedPaymant extends ChangeNotifier {
  String _selected= '';

  String get selected => _selected;

  void setSeleted(String selected) {
    _selected = selected;
    notifyListeners();
  }
  
}

class _PaymentListState extends State<PaymentList> {
  String _groupValue='';
  String? numberCard;

  @override
  Widget build(BuildContext context) {
        Future.delayed(Duration.zero, () { //รอ widget build เสร็จค่อยส่งข้อมูล
        setState(() {
          Provider.of<SelectedPaymant>(context, listen: false).setSeleted(_groupValue);
        });
      });
    return Column(
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Method",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            RadioListTile<String>(
              value: 'credit_card',
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  if (_groupValue == value) {
                    _groupValue = '';
                  } else {
                    _groupValue = value!;
                  }
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side:
                    const BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: SvgPicture.asset("assets/icons/mastercard.svg",
                        width: 40, height: 40),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Credit Card",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                      Text(
                        "9 22*****58 62",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RadioListTile<String>(
              value: 'Cash on Delivery',
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  if (_groupValue == value) {
                    _groupValue = '';
                  } else {
                    _groupValue = value!;
                  }
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side:
                    const BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: SvgPicture.asset("assets/icons/delivery-truck.svg",
                        width: 40, height: 40),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Cash on Delivery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Visibility(
          visible: _groupValue == 'credit_card',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Card Number",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              buildCardFormField(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Expire Date",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 160, height: 60, child: buildExpireFormField()),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CVC",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 160, height: 60, child: buildCvcFormField()),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  TextFormField buildCardFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => numberCard = newValue as String,
      decoration: const InputDecoration(
        labelText: "Card Number",
        hintText: "11 22 33 44 55",
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/mastercard.svg"),
      ),
    );
  }

  TextFormField buildExpireFormField() {
    return TextFormField(
       keyboardType: TextInputType.datetime,
      // onSaved: (newValue) => numberCard = newValue as String,
      decoration: const InputDecoration(
        labelText: "Expire Date",
        hintStyle: TextStyle(fontSize: 15),
        hintText: "20/11/2023",
        contentPadding: EdgeInsets.symmetric(
            //เนื้อหาในเวลากรอกข้อมูล textfield
            horizontal: 30,
            vertical: 20),
      ),
    );
  }

  TextFormField buildCvcFormField() {
    return TextFormField(
        keyboardType: TextInputType.phone,
      // onSaved: (newValue) => numberCard = newValue as String,
      decoration: const InputDecoration(
        labelText: "CVC",
        hintText: "********",
      ),
    );
  }
}
