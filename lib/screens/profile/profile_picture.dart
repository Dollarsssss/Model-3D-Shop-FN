import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_form.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
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
  String? email ;


  @override
  void initState() {
    super.initState();
    fetchProfile();
    
  }

  Future<void> fetchProfile() async {
    final url = Uri.parse('http://192.168.1.9:3000/users');
    final headers = {'Content-Type': 'application/json'};

    final response = await http.get(url, headers: headers);


    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = data.firstWhere((item) => item['email'] == email);

      fname = user['fname'];
      lname = user['lname'];

      if (user['avatar'].startsWith('https')) {
        // ถ้าเป็น URL
        setState(() {
          images = Image.network(user['avatar']);
        });
      } else {
        // ถ้าเป็น base64 string
        Uint8List bytes = base64Decode(user['avatar']);
        setState(() {
          images = Image.memory(bytes);
        });
      }

      print("OK State: ${response.statusCode}'");
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
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
   final emailModel = Provider.of<EmailModel>(context);
   email = emailModel.email;

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
        SizedBox(height: 15,),
        Column(
          children: [
            Text("$fname  $lname" ,
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            ),
            Text("$email",
              style: TextStyle(fontSize: 18, color: Color(0XFF8B8B8B)), // ตั้งค่าสไตล์ตามที่คุณต้องการ
            ),
          ],
        ),
      ],
    );
  }
}
