import 'package:flutter/material.dart';
import 'package:imtixon_6_oy/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash',
      onGenerateRoute: MyRoutes.instanse.onGenerate,
    );
  }
}
