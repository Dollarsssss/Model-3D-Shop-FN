import "package:flutter/material.dart";
import "package:flutter_ecommerce/constants.dart";
import "package:flutter_ecommerce/screens/complete_signup/complete_signup_form.dart";

class CompleteSignUp extends StatelessWidget {
  const CompleteSignUp({super.key});

  static String routeName = "/complete_signup" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Sign Up",
        style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18)),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: SizedBox(
        width: double.infinity, //ความกว้างเต็มพื้นที่
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text("Complete Sign Up",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                CompleteSignUpForm(),
                SizedBox(height: 30),
                Text("By Continue your confirm that you agree \nwith our Team and Condition",
                textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      )),
    );
  }
}
