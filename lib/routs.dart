import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/cart/cart_screen.dart';
import 'package:flutter_ecommerce/screens/complete_signup/complete_signup_screen.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:flutter_ecommerce/screens/order/order_screen.dart';
import 'package:flutter_ecommerce/screens/payment/payment_screen.dart';
import 'package:flutter_ecommerce/screens/profile/profile_screen.dart';
import 'package:flutter_ecommerce/screens/profile_update/profile_update_screen.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_ecommerce/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_ecommerce/screens/sign_up_success/sign_up_success_screen.dart';
import 'package:flutter_ecommerce/screens/splash/splash_screen.dart';



final Map<String , WidgetBuilder> routes = {

  SplashScreen.routeName:(context)=> const SplashScreen(),
  SignIn.routeName:(context) => const SignIn(),
  SignUp.routeName:(context)=> const SignUp(),
  CompleteSignUp.routeName:(context)=> const CompleteSignUp(),
  SignUpSuccess.routeName:(context)=> const SignUpSuccess(),
  Home.routeName:(context)=>const Home(),
  Profile.routeName:(context) => const Profile(),
  Cart.routeName:(context) =>  const Cart(),
  ProfileUpdate.routeName:(context)=> const ProfileUpdate(),
  Order.routeName:(context)=> const Order(),
  Payment.routeName:(context)=> const Payment(),
};