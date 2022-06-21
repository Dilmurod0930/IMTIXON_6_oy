import 'package:flutter/material.dart';
import 'package:imtixon_6_oy/core/constants/const.dart';
import 'package:imtixon_6_oy/provider/auth_provider.dart';
import 'package:imtixon_6_oy/screens/Auth/Sing_IN/sint_in_page.dart';
import 'package:provider/provider.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.blackConst,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: FontConst.kExtraLargeFont,
                          fontWeight: FontWeight.bold,
                          color: ColorConst.whiteConst),
                    ),
                  ),
                  Form(
                    key: context.watch<LoginProvider>().fromKey,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorConst.greyConst,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: context
                                  .watch<LoginProvider>()
                                  .emailController,
                              decoration: InputDecoration(
                                  hoverColor: ColorConst.blueConst,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  hintText: 'Email address',
                                  fillColor: Colors.red),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorConst.greyConst,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller:
                                  context.watch<LoginProvider>().passController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                hintText: 'Your password',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                       
                           SizedBox(height: MediaQuery.of(context).size.height * 0.07 ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.074,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: ColorConst.redConst,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: TextButton(
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConst.yellowConst,
                                ),
                              ),
                              onPressed: () {
                                context.read<LoginProvider>().singIn(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/sign_in', (route) => false);
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: ColorConst.whiteConst,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Text(
                        " if you have not registered yet",
                        style: TextStyle(color: ColorConst.greyConst),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Divider(
                            color: ColorConst.redConst,
                            thickness: 5,
                            endIndent: 12,
                          ),
                          Text(
                            'or continue with',
                            style: TextStyle(color: ColorConst.greyConst),
                          ),
                          Divider(
                            color: ColorConst.redConst,
                            thickness: 5,
                            endIndent: 12,
                          )
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          radius: 38,
                          backgroundColor: ColorConst.whiteConst,
                          child: Image.asset(
                            'assets/images/google.png',
                            fit: BoxFit.contain,
                          )),
                      CircleAvatar(
                          backgroundColor: ColorConst.whiteConst,
                          radius: 38,
                          child: Image.asset('assets/images/fasbook.png')),
                      CircleAvatar(
                          backgroundColor: ColorConst.whiteConst,
                          radius: 38,
                          child: Image.asset('assets/images/apple.png')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignINPage()));
        },
      ),
    );
  }
}
