import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';

class SignupStep2 extends StatefulWidget {
  const SignupStep2({super.key});

  @override
  _SignupProcess2State createState() => _SignupProcess2State();
}

class _SignupProcess2State extends State<SignupStep2> {
  final FocusNode _inputFocusNode = FocusNode();
  bool _isInputFocused = false;

  @override
  void initState() {
    super.initState();

    _inputFocusNode.addListener(() {
      setState(() {
        _isInputFocused = _inputFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _inputFocusNode.dispose();
    super.dispose();
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(),
            Column(children: [
              Text(
                  "Thank you for confirming your code. We will now continue with your account setup.",
                  style: paragraph_light),
              SizedBox(height: 16),
              TextField(
                readOnly: true,
                autocorrect: false,
                style: TextStyle(color: success, fontSize: 14),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.numbers,
                    color: success,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: success),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: success),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: success),
                  ),
                ),
              ),
            ]),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: primaryBtn,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/signup_3',
                          (Route<dynamic> route) => false,
                        );
                  },
                  child: const Text('Verify Code'),
                ),
              )
          ],
        ),
      ),
    );
  }
}
