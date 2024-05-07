import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfileUpdatePic extends StatefulWidget {
  const ProfileUpdatePic({
    super.key,
    required this.images,
    
  });
  final Image? images;


  @override
  State<ProfileUpdatePic> createState() => _ProfileUpdatePicState();
}

class _ProfileUpdatePicState extends State<ProfileUpdatePic> {

      void _showImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const CircleBorder(),
          child: AspectRatio(
            aspectRatio: 1, // สร้างสัดส่วน 1:1 สำหรับวงกลม
            child: ClipOval(
              child: widget.images,
            ),
          ),
        );
      },
    );
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
                backgroundImage: widget.images?.image,
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
                      onPressed:  _showImageDialog,
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg")),
                ),
              )
              
            ],
          ),
        ),
      ],
    );
  }
}