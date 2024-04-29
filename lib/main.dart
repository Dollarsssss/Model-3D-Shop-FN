import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/routs.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:flutter_ecommerce/screens/profile/profile_screen.dart';
import 'package:flutter_ecommerce/screens/splash/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: Profile.routeName,
      routes: routes ,
    );
  }
}



