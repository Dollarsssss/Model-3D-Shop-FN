import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/no_account.dart';
import 'package:flutter_ecommerce/components/social_card.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_form.dart';



class SignIn extends StatelessWidget {
  const SignIn({super.key});

    static String routeName = "/sign_in";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In",
        style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity, //ความกว้างเต็มพื้นที่
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text("Model World!",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text(
                  "Sign In with your email and password \n or continue with social media",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),
                const SignInForm(),
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
                const NoAccountText()
              ],
            ),
          ),
        ),
      )),
    );
  }
}


