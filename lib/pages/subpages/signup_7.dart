import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';

class SignupStep7 extends StatelessWidget {
  const SignupStep7({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
            appBar: AppBar(
        title: Image.asset('assets/logos/logo.png'),
        backgroundColor: primaryDarkColor,
        foregroundColor: primaryLightColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const ProgressBar(currentStep: 7),
            const Text('Signup Step 7 Content'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Finish Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
