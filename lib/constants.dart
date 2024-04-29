import 'package:flutter/material.dart';

// const kPrimaryColor = Color.fromARGB(255, 251, 99, 43);
const kPrimaryColor = Color.fromARGB(255, 64, 9, 205);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Colors.black;
const kTextLightColor = Color(0xFFACACAC);

// const kAnimationDuration = Duration(milliseconds: 200);

//Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"); //เอาไว้ตรวจรายละเอียดอีเมล
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kShortPhone = "Phone Number is too short";
const String kConfPassNullError = "Please Re-enter your password";
const String kMatchPassError = "Passwords don't match";
const String kFirstNameNullError = "Please Enter your First Name";
const String kLastNameNullError = "Please Enter your Last Name";
const String kPhoneNumberNullError = "Please Enter your phone number";

// RegExp คือคลาสใน Dart ที่ใช้สำหรับการจับคู่และค้นหาข้อความตามรูปแบบที่กำหนด (regular expression)

// final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"); คือการสร้างอ็อบเจ็กต์ RegExp ที่ใช้สำหรับการตรวจสอบว่าข้อความที่ให้มาเป็นอีเมลที่ถูกต้องหรือไม่ โดยมีรายละเอียดดังนี้:

// ^[a-zA-Z0-9.]+ ตรวจสอบว่าข้อความเริ่มต้นด้วยตัวอักษร (a-z, A-Z), ตัวเลข (0-9) หรือจุด (.) อย่างน้อยหนึ่งตัว
// @ ตรวจสอบว่ามีเครื่องหมาย @ อยู่ในข้อความ
// [a-zA-Z0-9]+ ตรวจสอบว่าหลังจากเครื่องหมาย @ มีตัวอักษรหรือตัวเลขอย่างน้อยหนึ่งตัว
// \.[a-zA-Z]+ ตรวจสอบว่าข้อความมีจุด (.) และตามด้วยตัวอักษรอย่างน้อยหนึ่งตัว