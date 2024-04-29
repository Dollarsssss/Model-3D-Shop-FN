import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:lottie/lottie.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  static String routeName = "/splash";
  
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
  
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushNamed(SignIn.routeName);
    });
  }
  
    @override
  Widget build(BuildContext context) { //('assets/images/pokemon_geodude.glb') //Image.asset('assets/images/splash_1.png')
    return Scaffold(
      body: Center(
        child:Lottie.network("https://lottie.host/e225e5dc-c8f0-4fc7-8ad0-fef907187bb6/3pfW2IN4Rg.json")
        ),
      );
    }
  }




