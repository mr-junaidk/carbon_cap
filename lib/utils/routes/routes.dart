import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_task/utils/routes/routes_name.dart';
import 'package:internship_task/view/home_screen.dart';
import 'package:internship_task/view/login_screen.dart';
import 'package:internship_task/view/otp_verification_screen.dart';
import 'package:internship_task/view/register_screen.dart';
import 'package:internship_task/view/splash_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashScreen());
      case RoutesName.register:
        return MaterialPageRoute(builder: (BuildContext context) => RegisterScreen());
      case RoutesName.verify:
        return MaterialPageRoute(builder: (BuildContext context) => OtpVerificationScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }

}