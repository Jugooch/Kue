import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';

class SignupStep3 extends StatelessWidget {
  const SignupStep3({super.key});

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
            const ProgressBar(currentStep: 3),
            const Text('Signup Step 3 Content'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup_4');
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
