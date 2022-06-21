import 'package:flutter/cupertino.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int time = 3;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: time),
      () => Navigator.pushReplacementNamed(context, "/home"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/Splash.png', fit: BoxFit.cover),
    );
  }
}
