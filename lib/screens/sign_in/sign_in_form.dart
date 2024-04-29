import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/custom_suffix.icon.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/components/form_error.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({super.key});

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password= "";
  bool remember = false;
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

  

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            buildEmailFormField(),
            const SizedBox(height: 30),
            buildPasswordFormField(),
            const SizedBox(height: 30),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor, 
                  checkColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                const Text("Remember me"),
                const Spacer(),
                const Text("Forget Password" ,style: TextStyle(decoration: TextDecoration.underline,color: kPrimaryColor),)
              ],
            ),
            FormError(errors: errors),
            const SizedBox(height: 20),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formkey.currentState!.validate()) {
                   _formkey.currentState!.save();
                   print("True : Email is $email and this is $password");
                   Navigator.pushNamed(context, Home.routeName);
                }else{print("Fasle : Email is $email and this is $password");}
              },
            )
          ],
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved:(newValue) => password = newValue as String,
      onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
             removeError(error: kPassNullError);
        }else if (value.length >= 8 && errors.contains(kShortPassError)) {
             removeError(error: kShortPassError);
        }
        return null;
        
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
             addError(error: kPassNullError);
             
        }else if (value.length < 8 && !errors.contains(kShortPassError)) {
             addError(error: kShortPassError);
             
        } if (errors.isNotEmpty) {
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

  TextFormField buildEmailFormField() {
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
            
        } if (errors.isNotEmpty) {
          return "";
        }
        return null;
        //เหตุผลที่ validator คืนค่าว่าง “” แทนที่จะคืนค่า null เมื่อมี error คือเพราะว่าคุณได้กำหนดให้คืนค่าว่าง “” ในเงื่อนไข if (errors.isNotEmpty).
        //เมื่อเรียก addError(error: kEmailNullError); หรือ addError(error: kInvalidEmailError); ภายใน validator, คุณกำลังเพิ่ม error ลงใน list errors. ดังนั้น, เมื่อมีการเพิ่ม error, errors.isNotEmpty จะเป็น true และ validator จะคืนค่าว่าง “”.
      },

      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")),
    );
  }
}
