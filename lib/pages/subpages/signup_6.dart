import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';

class SignupStep6 extends StatelessWidget {
  const SignupStep6({super.key});

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
            const ProgressBar(currentStep: 6),
            const Text('Signup Step 6 Content'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup_7');
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
