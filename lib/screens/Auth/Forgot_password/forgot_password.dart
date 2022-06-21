import 'package:flutter/material.dart';
import 'package:imtixon_6_oy/core/constants/const.dart';
import 'package:imtixon_6_oy/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Forgot password",
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
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.009),
                          Text(
                            "Enter your registered email. We’ll send you your password",
                            style: TextStyle(
                                color: ColorConst.greyConst,
                                fontSize: FontConst.kSmallFont),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1),
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
                                'Send my password',
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
                                      context, '/sing_up', (route) => false);
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
