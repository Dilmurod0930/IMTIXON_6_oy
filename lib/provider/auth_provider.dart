import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:imtixon_6_oy/core/constants/const.dart';
import 'package:imtixon_6_oy/core/widgets/snakbar_widget.dart';
import 'package:imtixon_6_oy/service/firebace/firbase_servise.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  Future singIn(BuildContext context) async {
    try {
      if (fromKey.currentState!.validate()) {
        await FireService.auth.signInWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => true);
      } else {
        SnakBarWidget.mymessger(context, 'Fill all fields', Colors.red);
      }
    } catch (e) {
      SnakBarWidget.mymessger(
          context, 'Error while sign in $e ', ColorConst.blueConst);
      print('1)ERROR--->' + e.toString());
    }
  }

  Future singUp(BuildContext context) async {
    try {
      if (fromKey.currentState!.validate()) {
        await FireService.auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        await FireService.store
            .collection('users')
            .doc(emailController.text)
            .set(
          {
            "name": nameController.text,
            "email": emailController.text,
            "password": passController.text,
            "phone_number": phoneController.text,
            "cireate_at": FieldValue.serverTimestamp(),
          },
        );
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        SnakBarWidget.mymessger(
          context,
          'Fill all fields',
          Colors.red,
        );
      }
    } catch (e) {
      SnakBarWidget.mymessger(
        context,
        'Tizimga kirishda hatolik yuz berdi',
        ColorConst.yellowConst,
      );
      print(
        '2)ERROR--->' + e.toString(),
      );
    }
  }

  Future signOut(BuildContext context) async {
    try {
      await FireService.auth.signOut();
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/sign_In',
        (route) => false,
      );
    } catch (e) {
      SnakBarWidget.mymessger(
        context,
        "Siz tizimdan chiqib ketinggiz ",
        ColorConst.yellowConst,
      );
    }
  }

  userLogOut() {
    FireService.auth.signOut();
    notifyListeners();
  }
}
