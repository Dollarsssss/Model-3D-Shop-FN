import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/custom_suffix.icon.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/components/form_error.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screens/sign_up_success/sign_up_success_screen.dart';

class CompleteSignUpForm extends StatefulWidget {
  const CompleteSignUpForm({super.key, required this.email, required this.password});
  
  final String email;
  final String password;

  @override
  State<CompleteSignUpForm> createState() => _CompleteSignUpFormState();
}

class _CompleteSignUpFormState extends State<CompleteSignUpForm> {



  final _formKey = GlobalKey<FormState>();
  final List<String> errors =[];
  String firstname = "";
  String lastname = "";
  String phone = "";
  String address = ""; 

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
    return  Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          const SizedBox(height: 30,),
          buildLastNameFormField(),
          const SizedBox(height: 30,),
          buildPhoneFormField(),
          const SizedBox(height: 30,),
          FormError(errors: errors),
          const SizedBox(height: 30,),
          DefaultButton(
            text: "Continue", 
            press: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                print("True email is ${widget.email} password is${widget.password} First name: $firstname Lastname is $lastname phone is $phone" );
                Navigator.pushNamed(context, SignUpSuccess.routeName);
              }else{print("false First name: $firstname Lastname is $lastname phone is $phone" );}
            })
        ],
      ),
    );
  }


  TextFormField buildPhoneFormField() {
    return TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (newValue) => phone = newValue as String,
          onChanged: (value) {
            if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
                removeError(error: kPhoneNumberNullError);
            }else if (value.length >= 10 && errors.contains(kShortPhone)) {
             removeError(error: kShortPhone);
            }
            return null;
          },
          validator: (value) {
            if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
                addError(error: kPhoneNumberNullError);
                
            } else if (value.length < 10 && !errors.contains(kShortPhone)) {
             addError(error: kShortPhone);
             
            } if (errors.isNotEmpty) {
              return "";
            }
            return null;
            //เหตุผลที่ validator คืนค่าว่าง “” แทนที่จะคืนค่า null เมื่อมี error คือเพราะว่าคุณได้กำหนดให้คืนค่าว่าง “” ในเงื่อนไข if (errors.isNotEmpty).
            //เมื่อเรียก addError(error: kEmailNullError); หรือ addError(error: kInvalidEmailError); ภายใน validator, คุณกำลังเพิ่ม error ลงใน list errors. ดังนั้น, เมื่อมีการเพิ่ม error, errors.isNotEmpty จะเป็น true และ validator จะคืนค่าว่าง “”.
          },

          decoration: const InputDecoration(
              labelText: "Phone Number",
              hintText: "Enter your phone number",
              suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg")),
        );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
          onSaved: (newValue) => lastname = newValue as String,
           onChanged: (value) {
            if (value.isNotEmpty && errors.contains(kLastNameNullError)) {
                removeError(error: kLastNameNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value!.isEmpty && !errors.contains(kLastNameNullError)) {
                addError(error: kLastNameNullError);
                
            } if (errors.isNotEmpty) {
              return "";
            }
            return null;
            //เหตุผลที่ validator คืนค่าว่าง “” แทนที่จะคืนค่า null เมื่อมี error คือเพราะว่าคุณได้กำหนดให้คืนค่าว่าง “” ในเงื่อนไข if (errors.isNotEmpty).
            //เมื่อเรียก addError(error: kEmailNullError); หรือ addError(error: kInvalidEmailError); ภายใน validator, คุณกำลังเพิ่ม error ลงใน list errors. ดังนั้น, เมื่อมีการเพิ่ม error, errors.isNotEmpty จะเป็น true และ validator จะคืนค่าว่าง “”.
          },
          decoration: const InputDecoration(
              labelText: "Last Name",
              hintText: "Enter your Last name",
              suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")),
        );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
          onSaved: (newValue) => firstname = newValue as String,
          onChanged: (value) {
            if (value.isNotEmpty && errors.contains(kFirstNameNullError)) {
                removeError(error: kFirstNameNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value!.isEmpty && !errors.contains(kFirstNameNullError)) {
                addError(error: kFirstNameNullError);
                
            } if (errors.isNotEmpty) {
              return "";
            }
            return null;
            //เหตุผลที่ validator คืนค่าว่าง “” แทนที่จะคืนค่า null เมื่อมี error คือเพราะว่าคุณได้กำหนดให้คืนค่าว่าง “” ในเงื่อนไข if (errors.isNotEmpty).
            //เมื่อเรียก addError(error: kEmailNullError); หรือ addError(error: kInvalidEmailError); ภายใน validator, คุณกำลังเพิ่ม error ลงใน list errors. ดังนั้น, เมื่อมีการเพิ่ม error, errors.isNotEmpty จะเป็น true และ validator จะคืนค่าว่าง “”.
          },
          decoration: const InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")),
        );
  }
}