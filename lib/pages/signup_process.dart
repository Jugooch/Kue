import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';

class SignupProcess extends StatefulWidget {
  const SignupProcess({super.key});

  @override
  _SignupProcessState createState() => _SignupProcessState();
}

class _SignupProcessState extends State<SignupProcess> {
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
      body: InkWell(
            onTap: () {
              //close keyboard when tapping outside of it
              FocusScope.of(context).unfocus();
            },
            child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(),
            Column(children: [
              Text(
                  "Please enter the 6 digit code you received from the referral email. The code expires after 15 minutes, so you will have to be sent another if that time passes.",
                  style: paragraph_light),
              SizedBox(height: 16),
              TextField(
                focusNode: _inputFocusNode,
                autocorrect: false,
                style: TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers,
                      color:
                          _isInputFocused ? primaryColor : primaryLightColor),
                  hintText: 'Enter Code Here...',
                  hintStyle: _isInputFocused
                      ? TextStyle(fontSize: 14, color: primaryColor)
                      : paragraph_light,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryLightColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
            ]),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: primaryBtn,
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup_2');
                  },
                  child: const Text('Verify Code'),
                ),
              )
          ],
        ),
      ),
    ));
  }
}
