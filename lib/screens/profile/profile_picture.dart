import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProFilePic extends StatelessWidget {
  const ProFilePic({
    super.key,
  });

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
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/Profile Image.png"),
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
                    onPressed: (){}, 
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