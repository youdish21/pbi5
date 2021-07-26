import 'package:flutter/material.dart';
import 'Sign up.dart';
import 'homepage.dart';
import 'welcome.dart';
import 'Sign In.dart';



const String signUp = 'Sign-Up';
const String signIn = 'SignIn';
const String register = 'RegisterPage';
const String home = 'homepage';
const String wel = 'welcome';


Route<dynamic> controller(RouteSettings settings){
  switch (settings.name){
    case wel:
      return MaterialPageRoute(builder: (context) => Welcome());
    case signIn:
      return MaterialPageRoute(builder: (context) => SignIn());
    case signUp:
      return MaterialPageRoute(builder: (context) => SignUp());
    case home:
      return MaterialPageRoute(builder: (context) =>  MyHomePage());



    default:
      throw('This route name does not exists');
  }

}