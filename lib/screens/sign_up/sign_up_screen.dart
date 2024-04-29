import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/social_card.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screens/sign_up/sign_up_form.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  static String routeName = "/sign_up";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Sign Up",
        style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18)),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity, //ความกว้างเต็มพื้นที่
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text("Register Account",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 70),
                const SignUpForm(),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icons: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icons: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icons: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("By Continue your confirm that you agree \nwith our Team and Condition",
                textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      )),
    );
  }
}