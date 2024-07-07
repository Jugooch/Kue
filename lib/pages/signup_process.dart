import 'package:flutter/material.dart';

class SignupProcess extends StatelessWidget {
  const SignupProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your signup steps here
            ElevatedButton(
              onPressed: () {                
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Complete Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
