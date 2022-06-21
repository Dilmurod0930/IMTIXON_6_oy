import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imtixon_6_oy/provider/auth_provider.dart';
import 'package:imtixon_6_oy/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoutes.instanse.onGenerate,
      initialRoute: '/splash',
    );
  }
}
