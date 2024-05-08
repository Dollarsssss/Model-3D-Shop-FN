import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/routs.dart';
import 'package:flutter_ecommerce/screens/cart/cart_form.dart';
import 'package:flutter_ecommerce/screens/details/add_to_cart.dart';
import 'package:flutter_ecommerce/screens/sign_in/sign_in_form.dart';
import 'package:flutter_ecommerce/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'theme.dart';


void main() {
  runApp( 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmailModel()),
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => CartAdd()),
        ChangeNotifierProvider(create: (context) => AllItemPrice()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes ,
    );
  }
}



