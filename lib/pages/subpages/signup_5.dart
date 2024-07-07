import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';

class SignupStep5 extends StatelessWidget {
  const SignupStep5({super.key});

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
            const ProgressBar(currentStep: 5),
            const Text('Signup Step 5 Content'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup_6');
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
