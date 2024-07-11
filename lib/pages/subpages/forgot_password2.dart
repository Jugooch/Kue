import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';

class ForgotPassword2 extends StatefulWidget {
  const ForgotPassword2({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword2> {

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: Image.asset('assets/logos/logo.png'),
          backgroundColor: primaryDarkColor,
          foregroundColor: primaryLightColor,
        ),
        body: Padding(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "We have sent a link to your email to reset your password. Please follow all instructions from that email.",
                        style: paragraph_light),
                    SizedBox(height: 16),
                    Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: primaryBtn,
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/',
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: const Text('Back to Login'),
                          ),
                        )
                  ],
                ),
              ),
            ));
  }
}
