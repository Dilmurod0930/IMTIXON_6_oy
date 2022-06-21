import 'package:flutter/material.dart';
import 'package:imtixon_6_oy/core/constants/const.dart';
import 'package:imtixon_6_oy/provider/auth_provider.dart';
import 'package:imtixon_6_oy/screens/Splash/splash_initial.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(
      //   context: context,
      //   title: "Login",
      // ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Form(
                key: context.watch<LoginProvider>().fromKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 13),
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().passController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Passwor',
                        ),
                      ),
                      const SizedBox(height: 13),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.063,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: ColorConst.blueConst,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TextButton(
                          child: Text(
                            'Login In',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorConst.blueConst,
                            ),
                          ),
                          onPressed: () {
                            context.read<LoginProvider>().singIn(context);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/sign_Up', (route) => false);
                            },
                            child: Text(
                              'Create account',
                              style: TextStyle(
                                color: ColorConst.blueConst,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        icon: const  Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Splash()));
        },
      ),
    );
  }
}
