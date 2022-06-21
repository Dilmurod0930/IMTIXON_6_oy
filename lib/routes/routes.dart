import 'package:flutter/material.dart';
import 'package:imtixon_6_oy/screens/Auth/Sing_IN/sint_in_page.dart';
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
        case '/sing_in':
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
