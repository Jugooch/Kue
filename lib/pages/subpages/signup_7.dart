import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';

class SignupStep7 extends StatefulWidget {
  const SignupStep7({super.key});

  @override
  _SignupStep7State createState() => _SignupStep7State();
}

class _SignupStep7State extends State<SignupStep7> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Image.asset('assets/logos/logo.png'),
        backgroundColor: primaryDarkColor,
        foregroundColor: primaryLightColor,
      ),
      body: InkWell(
        onTap: () {
          // Close keyboard when tapping outside of it
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const ProgressBar(currentStep: 4),
              Column(children: [
                Text(
                  "That’s it! Congratulations on finishing your account setup. Now get out there and meet the one for you!",
                  style: paragraph_light,
                ),
              ]),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: primaryBtn,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
