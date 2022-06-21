import 'package:flutter/material.dart';
import 'package:imtixon_6_oy/core/constants/const.dart';
import 'package:imtixon_6_oy/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                      "Log In",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, "/password", (route) => false);
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: ColorConst.whiteConst,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/sign_Up', (route) => false);
                                },
                                child: Text(
                                  'Sign Up',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: IconButton(
      //   icon: const Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => Splash()));
      //   },
      // ),
    );
  }
}
