import 'dart:convert';
import 'package:flutter_ecommerce/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/custom_suffix.icon.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/components/form_error.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';



class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class EmailModel extends ChangeNotifier {
  String _email = '';

  String get email => _email;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }
}
class UserModel extends ChangeNotifier {
  User? _user ;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}

class _SignInFormState extends State<SignInForm> {
  final _formkey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool remember = false;
  final List<String> errors = [];

  Future<void> _login() async {
    final url = Uri.parse('http://192.168.1.9:3000/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': _email.text, 'password': _password.text});

    final user = await User.fetchUser(_email.text);
  
    final res = await http.post(url, headers: headers, body: body);

    if (res.statusCode == 200) {

       Provider.of<EmailModel>(context, listen: false).setEmail(_email.text);
       Provider.of<UserModel>(context, listen: false).setUser(user);
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Lottie.asset("assets/animations/login_success.json"),
                  const Text('May you have a good experience using the Application.'),
                ],
              ),
            );
          });
          
        Future.delayed(const Duration(seconds: 3), () {
        // ปิด dialog
        Navigator.of(context).pop();
        // ไปหน้าถัดไป
        Navigator.pushNamed(context, Home.routeName);

      });
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Error',
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Lottie.asset("assets/animations/login_error.json"),
                  const Text('Email or password is incorrect.'),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
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
                const Text(
                  "Forget Password",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: kPrimaryColor),
                )
              ],
            ),
            FormError(errors: errors),
            const SizedBox(height: 20),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  print("True : Email is $_email and this is $_password");
                  _login();
                  //  Navigator.pushNamed(context, Home.routeName);
                } else {
                  print("Fasle : Email is $_email and this is $_password");
                }
              },
            )
          ],
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _password,
      obscureText: true,
      //onSaved:(newValue) => _password = newValue as String,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          addError(error: kPassNullError);
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          addError(error: kShortPassError);
        }
        if (errors.isNotEmpty) {
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
      controller: _email,
      //onSaved: (newValue) => _email = newValue as String,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          addError(error: kEmailNullError);
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          addError(error: kInvalidEmailError);
        }
        if (errors.isNotEmpty) {
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
