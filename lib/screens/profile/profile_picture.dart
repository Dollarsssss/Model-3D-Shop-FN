import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class ProFilePic extends StatefulWidget {
  ProFilePic({Key? key}) : super(key: key);

  @override
  _ProFilePicState createState() => _ProFilePicState();
}

class _ProFilePicState extends State<ProFilePic> {
  Image? images;

  @override
  void initState() {
    super.initState();
    _login();
  }

  Future<void> _login() async {
    final url = Uri.parse('http://192.168.1.9:3000/users');
    final headers = {'Content-Type': 'application/json'};

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = data.firstWhere((item) => item['id'] == 150006);
      Uint8List bytes = base64Decode(user['avatar']);

      setState(() {
        images = Image.memory(bytes);
      });
      print("${user['avatar']}");
      print("image : $images");
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg")),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
