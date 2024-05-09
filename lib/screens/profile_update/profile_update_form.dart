import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/custom_suffix.icon.dart';
import 'package:flutter_ecommerce/components/defualt_button.dart';
import 'package:flutter_ecommerce/components/form_error.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/models/user.dart';
import 'package:flutter_ecommerce/screens/profile_update/prifile_update_pic.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_form.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ProfileUpdateForm extends StatefulWidget {
  const ProfileUpdateForm({Key? key}) : super(key: key);

  @override
  _ProfileUpdateFormState createState() => _ProfileUpdateFormState();

}

class _ProfileUpdateFormState extends State<ProfileUpdateForm> {
  Image? images;
  String? email ;

  final _formkey = GlobalKey<FormState>();

  String firstname = "";
  String lastname = "";
  String phone = "";
  String address = "";
  String img64 = "";
  bool imageUpload = false;
 

  final List<String> errors = [];

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserModel>(context, listen: false);
    User? users = user.user;
    email = users?.email;
      if (users!.avatar.startsWith('https')) {
      // ถ้าเป็น URL
      setState(() {
        images = Image.network(users.avatar);
      });
    } else {
      // ถ้าเป็น base64 string
      Uint8List bytes = base64Decode(users.avatar);
      setState(() {
        images = Image.memory(bytes);
      });
    }
  }
    
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


Future<void> updateProfile(String fname, String lname, String phone, String avatar ,String address ,String email,) async {
  final url = Uri.parse('http://192.168.1.9:3000/update_profile');
  final headers = {'Content-Type': 'application/json'};
  
  final body = jsonEncode({
    'fname': fname,
    'lname': lname,
    'phone': phone,
    'avatar': avatar,
    'address': address,
    'email': email,
  });

  final response = await http.put(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('Profile updated successfully');
  } else {
    print('Failed to update profile: ${response.statusCode}');
  }
}

  @override
  Widget build(BuildContext context) {
   
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              children: [
                ProfileUpdatePic(images: images ),
                  const SizedBox(height: 30),
                  buildFirstNameFormField(),
                  const SizedBox(height: 30),
                  buildLastNameFormField(),
                  const SizedBox(height: 30),
                  buildPhoneFormField(),
                  const SizedBox(height: 30),
                  buildAddressFormField(),
                  const SizedBox(height: 20),
                  buildUplaodImage(),
                  const SizedBox(height: 10),
                  FormError(errors: errors),
                  const SizedBox(height: 20),
                  DefaultButton(
                    text: "Save Changes", 
                    press: (){
                    if (_formkey.currentState!.validate()  && imageUpload == true ) {
                    _formkey.currentState!.save();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                          return AlertDialog(
                              title: const Text('Update Profile'),
                              content: const Text('Do you want to update your profile? \nApplication may need to be restarted.'),
                              actions: <Widget>[
                                  TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                          Navigator.of(context).pop();
                                      },
                                  ),
                                  TextButton(
                                      child: const Text('Submit'),
                                      onPressed: () {
                                          updateProfile(firstname,lastname,phone,img64,address,email!);
                                          Navigator.pushNamed(context, SignIn.routeName);
                                      },
                                  ),
                              ],
                          );
                      },
                  );
                 
                  } else {
                     addError(error: kImageNull);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

   ElevatedButton buildUplaodImage() {
    return ElevatedButton(
        child: const Text('Upload Image'),
        onPressed: () async {
          // ignore: deprecated_member_use
          final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
          if (pickedFile != null) {

            final dir = await getTemporaryDirectory();
            final targetPath = '${dir.absolute.path}/temp.jpg';
              
            // บีบอัด
            final result = await FlutterImageCompress.compressAndGetFile(
              pickedFile.path,
              targetPath,
              quality: 10,
            );
            final bytes = await result?.readAsBytes();
            img64 = base64Encode(bytes!);

            Uint8List bytess = base64Decode(img64);
            setState(() {
              images = Image.memory(bytess);
            });
            imageUpload = true;
            removeError(error: kImageNull);
          }else {
            imageUpload = false;
            addError(error: kImageNull);
            print('No image selected.');
          }
        },
      );
    }

    TextFormField buildAddressFormField() {
    return TextFormField(
          onSaved: (newValue) => address = newValue as String,
           onChanged: (value) {
            if (value.isNotEmpty && errors.contains(kAddressNullError)) {
                removeError(error: kAddressNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value!.isEmpty && !errors.contains(kAddressNullError)) {
                addError(error: kAddressNullError);
                
            } if (errors.isNotEmpty) {
              return "";
            }
            return null;
            //เหตุผลที่ validator คืนค่าว่าง “” แทนที่จะคืนค่า null เมื่อมี error คือเพราะว่าคุณได้กำหนดให้คืนค่าว่าง “” ในเงื่อนไข if (errors.isNotEmpty).
            //เมื่อเรียก addError(error: kEmailNullError); หรือ addError(error: kInvalidEmailError); ภายใน validator, คุณกำลังเพิ่ม error ลงใน list errors. ดังนั้น, เมื่อมีการเพิ่ม error, errors.isNotEmpty จะเป็น true และ validator จะคืนค่าว่าง “”.
          },
          decoration: const InputDecoration(
              labelText: "Address",
              hintText: "Enter your Address",
              suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg")),
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
            
          },
          decoration: const InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }
}

 

   
  