import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/custom_suffix.icon.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/components/form_error.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screens/complete_signup/complete_signup_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}



class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();

   String email = "";
   String password ="";
   String confirm_password="";

  final List<String> errors = [];

  void addError({required String error}){
    if (!errors.contains(error)){
    setState(() {
      errors.add(error);
    });
    }
  }

  void removeError({required String error}){
    if(errors.contains(error)){
      setState(() {
        errors.remove(error);
      });
    }
  }
  
  Future<void> _checkEmail() async {

    final url = Uri.parse('http://192.168.1.9:3000/check-email');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'email': email, 
    });

    final res = await http.post(url, headers: headers, body: body);

      if (res.statusCode == 400) {
        print('Email นี้ถูกใช้งานแล้ว');
        ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar( content:Text('Email already exists')));
    } else if (res.statusCode == 200) {
        print('Email นี้สามารถใช้งานได้');
           Navigator.pushNamed(
                context,
                CompleteSignUp.routeName,
                arguments: {
                  'email': email,
                  'password': password,
                },
              );
        //Navigator.pushNamed(context, SignUpSuccess.routeName);
    } else {
      
        print('Status Code: ${res.statusCode}');
        print('Response Body: ${res.body}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formkey,
      child: Column(
      children: [
        bulidEmailFormField(),
        const SizedBox(height: 30),
        bulidPasswordFormField(),
        const SizedBox(height: 30),
        buildConfPasswordFormField(),
        const SizedBox(height: 15),
        FormError(errors: errors),
        const SizedBox(height: 40),
        DefaultButton(
          text: "Continue",
          press: (){
            if(_formkey.currentState!.validate()){
                _formkey.currentState!.save();
                print("True : Email is $email and this is $password and Confirm Password is $confirm_password");
                 _checkEmail();
             
            }else{
              print("Fasle : Email is $email and this is $password and Confirm Password is $confirm_password");
              }
          }
        ),  
      ],
    ));
  }

  TextFormField buildConfPasswordFormField() {
    
    return TextFormField(
        obscureText: true,
        onSaved: (newValue) => confirm_password = newValue as String,
        onChanged: (value) {
          confirm_password = value;
          if(value.isNotEmpty && errors.contains(kConfPassNullError)){
              removeError(error: kConfPassNullError);
          }else if (password == confirm_password) {
              removeError(error: kMatchPassError);
          }
          return null;
        },
        validator: (value) {
          if(value!.isEmpty && !errors.contains(kConfPassNullError)){
             addError(error: kConfPassNullError);

          }else if (password != confirm_password) {
             addError(error: kMatchPassError);

          }if(errors.isNotEmpty){
             return "";
          }

          return null;
        },
        decoration: const InputDecoration(
            labelText: "Confirm Password",
            hintText: "Re-enter your password",
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")),
      );
  }

  TextFormField bulidPasswordFormField() {
    return TextFormField(
        obscureText: true,
        onSaved: (newValue) => password = newValue as String,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
             removeError(error: kPassNullError);
          } else if (value.length >= 8 && errors.contains(kShortPassError)) {
             removeError(error: kShortPassError);
          }
          password = value;
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPassNullError)) {
             addError(error: kPassNullError);
            
          } else if (value.length < 8 && !errors.contains(kShortPassError)) {
             addError(error: kShortPassError);
             
          } if(errors.isNotEmpty){
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")),
      );
  }

  TextFormField bulidEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue as String,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
           removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)) {
           removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
           addError(error: kEmailNullError);
          
        } else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)) {
           addError(error: kInvalidEmailError);
          
        } if(errors.isNotEmpty){
            return "";
          }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")),
    );
  }
}
