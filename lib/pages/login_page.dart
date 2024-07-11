import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isUsernameFocused = false;
  bool _isPasswordFocused = false;

  @override
  void initState() {
    super.initState();

    _usernameFocusNode.addListener(() {
      setState(() {
        _isUsernameFocused = _usernameFocusNode.hasFocus;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: InkWell(
            onTap: () {
              //close keyboard when tapping outside of it
              FocusScope.of(context).unfocus();
            },
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 32, right: 32, top: 184, bottom: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          "Welcome to",
                          style: header2_light,
                        ),
                        SizedBox(height: 16),
                        Image.asset("assets/logos/logo.png")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          focusNode: _usernameFocusNode,
                          autocorrect: false,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.person, color: _isUsernameFocused ? primaryColor : primaryLightColor),
                            hintText: 'Username',
                            hintStyle: _isUsernameFocused ? TextStyle(fontSize: 14, color: primaryColor) : paragraph_light,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryLightColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                            focusNode: _passwordFocusNode,
                            obscureText: true,
                            autocorrect: false,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.lock, color: _isPasswordFocused ? primaryColor : primaryLightColor),
                              hintText: 'Password',
                            hintStyle: _isPasswordFocused ? TextStyle(fontSize: 14, color: primaryColor) : paragraph_light,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryLightColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                            )),
                        SizedBox(height: 16),
                        TextButton(
                            style: textButton,
                            onPressed: () {Navigator.pushNamed(context, '/forgot_password');},
                            child: Text("Forgot Password?")),
                        SizedBox(height: 32),
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
                            child: const Text('Login'),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text("Received a referral code?",
                            style: paragraph_light),
                        SizedBox(height: 16),
                        Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: secondaryBtn,
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: const Text('Sign Up'),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
