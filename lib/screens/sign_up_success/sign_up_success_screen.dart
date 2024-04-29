import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:lottie/lottie.dart';

class SignUpSuccess extends StatelessWidget {
  static String routeName = "/sign_up_success";

  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Success !",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45)),
                const SizedBox(height: 20),
                const Text(
                  "Your account has been created",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 60),
                Lottie.asset("assets/animations/success.json"),
    
              ],
            ),
          ),
          DefaultButton(text: "Continue", press: () {
            Navigator.pushNamed(context, SignIn.routeName);
          })
        ],
      ),
    ));
  }
}

