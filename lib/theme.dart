import "package:flutter/material.dart";
import "package:flutter_ecommerce/constants.dart";

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorrationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

InputDecorationTheme inputDecorrationTheme() {

   var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: kTextColor),
        gapPadding: 10,
      );
   
  return InputDecorationTheme(
      // labelText: "Email",
      // hintText: "Enter your email",
      floatingLabelBehavior: FloatingLabelBehavior.always, //เอา label ไว้มุมซ้ายบน 
      contentPadding: const EdgeInsets.symmetric(//เนื้อหาในเวลากรอกข้อมูล textfield
          horizontal: 42,
          vertical: 20),
      enabledBorder: border,
      focusedBorder: border,
      errorBorder: border,
      focusedErrorBorder: border
    );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: kTextColor), // ข้อความที่มีขนาดปกติและหนา
    bodyMedium: TextStyle(color: kTextColor), //ข้อความที่มีขนาดปกติแต่ไม่หนา
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
   
  );
}
