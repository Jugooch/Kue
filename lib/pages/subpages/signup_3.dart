import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';

class SignupStep3 extends StatefulWidget {
  const SignupStep3({super.key});

  @override
  _SignupStep3State createState() => _SignupStep3State();
}

class _SignupStep3State extends State<SignupStep3> {
  final FocusNode _firstNameFocusNode = FocusNode();
  bool _isFirstNameFocused = false;
  final FocusNode _lastNameFocusNode = FocusNode();
  bool _isLastNameFocused = false;
  final FocusNode _ageFocusNode = FocusNode();
  bool _isAgeFocused = false;
  final FocusNode _emailFocusNode = FocusNode();
  bool _isEmailFocused = false;
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isPasswordFocused = false;
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  bool _isConfirmPasswordFocused = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    _firstNameFocusNode.addListener(() {
      setState(() {
        _isFirstNameFocused = _firstNameFocusNode.hasFocus;
      });
    });

    _lastNameFocusNode.addListener(() {
      setState(() {
        _isLastNameFocused = _lastNameFocusNode.hasFocus;
      });
    });

    _ageFocusNode.addListener(() {
      setState(() {
        _isAgeFocused = _ageFocusNode.hasFocus;
      });
    });

    _emailFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _emailFocusNode.hasFocus;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });

    _confirmPasswordFocusNode.addListener(() {
      setState(() {
        _isConfirmPasswordFocused = _confirmPasswordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _ageFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final age = int.tryParse(value);
    if (age == null || age < 18 || age > 120) {
      return 'Please enter a valid age between 18 and 120';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final passwordPattern =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (!passwordPattern.hasMatch(value)) {
      return 'Password must be at least 8 characters long and include a capital letter, lowercase letter, number, and special character';
    }
    return null;
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
                const ProgressBar(currentStep: 1),
                Column(
                  children: [
                    Text("Let's Start by entering your personal information.",
                        style: paragraph_light),
                    SizedBox(height: 16),
                    TextField(
                      controller: _firstNameController,
                      focusNode: _firstNameFocusNode,
                      autocorrect: false,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: _isFirstNameFocused
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
                    TextField(
                      controller: _lastNameController,
                      focusNode: _lastNameFocusNode,
                      autocorrect: false,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: _isLastNameFocused
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
                    TextField(
                      controller: _ageController,
                      focusNode: _ageFocusNode,
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Age',
                        hintStyle: _isAgeFocused
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
                    TextField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      autocorrect: false,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: _isEmailFocused
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
                    TextField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: true,
                      autocorrect: false,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: _isPasswordFocused
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
                    TextField(
                      controller: _confirmPasswordController,
                      focusNode: _confirmPasswordFocusNode,
                      obscureText: true,
                      autocorrect: false,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: _isConfirmPasswordFocused
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
                  ],
                ),
                Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: primaryBtn,
                        onPressed: () {
                          final ageValidation =
                              validateAge(_ageController.text);
                          final passwordValidation =
                              validatePassword(_passwordController.text);
                          // if (ageValidation != null ||
                          //     passwordValidation != null) {
                          //   // Handle validation errors
                          // } else {
                          //   // Proceed to the next step
                          //   Navigator.pushNamed(context, '/signup_4');
                          // }
                          Navigator.pushNamed(context, '/signup_4');
                        },
                        child: const Text('Next'),
                      ),
                    ),
              ],
            ),
          ),
        ));
  }
}
