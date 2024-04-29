import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account", style: TextStyle(fontSize: 16)),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () =>  Navigator.pushNamed(context, SignUp.routeName),
          child: const Text("Sign Up",
              style: TextStyle(fontSize: 16, color: kPrimaryColor)),
        ),
      ],
    );
  }
}