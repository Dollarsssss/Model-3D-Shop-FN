import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/user.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_form.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProFilePic extends StatefulWidget {
  ProFilePic({Key? key}) : super(key: key);

  @override
  _ProFilePicState createState() => _ProFilePicState();
}

class _ProFilePicState extends State<ProFilePic> {
  Image? images;
  String? fname;
  String? lname;
  String? email;

  @override
  void initState() {
    super.initState();
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const CircleBorder(),
          child: AspectRatio(
            aspectRatio: 1, // สร้างสัดส่วน 1:1 สำหรับวงกลม
            child: ClipOval(
              child: images,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    User? users = user.user;

    if (users!.avatar.startsWith('https')) {
      // ถ้าเป็น URL
      setState(() {
        images = Image.network(users.avatar);
      });
    } else {
      // ถ้าเป็น base64 string
      Uint8List bytes = base64Decode(users.avatar);
      setState(() {
        images = Image.memory(bytes);
      });
    }

    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundImage: images?.image,
              ),
              Positioned(
                right: -12,
                bottom: 0,
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: const Color(0xFFF5F6F9),
                      ),
                      onPressed: _showImageDialog,
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg")),
                ),
              )
            ],
          ),
        ),
        const SizedBox( height: 15 ),
        Column(
          children: [
            Text(
              "${users.fname}  ${users.lname}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "${users.email}",
              style: const TextStyle(
                  fontSize: 18,
                  color: Color(0XFF8B8B8B)), // ตั้งค่าสไตล์ตามที่คุณต้องการ
            ),
          ],
        ),
      ],
    );
  }
}
