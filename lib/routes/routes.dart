import 'package:flutter/material.dart';
import 'package:imtixon_6_oy/screens/Auth/Forgot_password/forgot_password.dart';
import 'package:imtixon_6_oy/screens/Auth/Sing_IN/sint_in_page.dart';
import 'package:imtixon_6_oy/screens/Auth/Sing_UP/sing_up_page.dart';
import 'package:imtixon_6_oy/screens/Splash/splash_initial.dart';

class MyRoutes {
  static final MyRoutes _instanse = MyRoutes.init();
  static MyRoutes get instanse => MyRoutes._instanse;
  MyRoutes.init();

  Route? onGenerate(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/sing_up':
        return MaterialPageRoute(builder: (_) => SingUpPage());
      case '/sign_in':
        return MaterialPageRoute(builder: (_) => SignINPage());
      case '/password':
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
    }
  }
}
