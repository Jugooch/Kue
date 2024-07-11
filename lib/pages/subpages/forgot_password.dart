import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final FocusNode _fieldFocusNode = FocusNode();
  bool _isFieldFocused = false;

  @override
  void initState() {
    super.initState();

    _fieldFocusNode.addListener(() {
      setState(() {
        _isFieldFocused = _fieldFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _fieldFocusNode.dispose();
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "Please enter your email below. If we have a record of your email, we will send you a link to reset your password.",
                        style: paragraph_light),
                    SizedBox(height: 16),
                    TextField(
                      focusNode: _fieldFocusNode,
                      autocorrect: false,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,
                            color: _isFieldFocused
                                ? primaryColor
                                : primaryLightColor),
                        hintText: 'Email',
                        hintStyle: _isFieldFocused
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
                    SizedBox(height: 16),
                    Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: primaryBtn,
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/forgot_password2',
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: const Text('Send Link'),
                          ),
                        )
                  ],
                ),
              ),
            )));
  }
}
