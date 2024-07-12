import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';
import 'package:kue/models/models.dart'; // Ensure you import your UserModel
import 'dart:io';
import 'package:kue/dao/user_dao.dart'; // Ensure you import your UserDao

class SignupStep6 extends StatefulWidget {
  const SignupStep6({super.key});

  @override
  _SignupStep6State createState() => _SignupStep6State();
}

class _SignupStep6State extends State<SignupStep6> {
  final FocusNode _genderFocusNode = FocusNode();
  bool _isGenderFocused = false;
  final FocusNode _sexualOrientationFocusNode = FocusNode();
  bool _isSexualOrientationFocused = false;
  final FocusNode _preferenceFocusNode = FocusNode();
  bool _isPreferenceFocused = false;

  String? _selectedGender;
  String? _selectedSexualOrientation;
  String? _selectedPreference;

  List<String> genders = ['Male', 'Female', 'Other'];
  List<String> sexualOrientations = ['Straight', 'Gay', 'Lesbian', 'Bisexual', 'Queer', 'Other'];
  List<String> preferences = ['Men', 'Women', 'Everyone'];

  @override
  void initState() {
    super.initState();

    _genderFocusNode.addListener(() {
      setState(() {
        _isGenderFocused = _genderFocusNode.hasFocus;
      });
    });

    _sexualOrientationFocusNode.addListener(() {
      setState(() {
        _isSexualOrientationFocused = _sexualOrientationFocusNode.hasFocus;
      });
    });

    _preferenceFocusNode.addListener(() {
      setState(() {
        _isPreferenceFocused = _preferenceFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _genderFocusNode.dispose();
    _sexualOrientationFocusNode.dispose();
    _preferenceFocusNode.dispose();

    super.dispose();
  }

    Future<void> _uploadImagesAndSaveUser(UserModel userModel) async {


    UserModel finalUser = UserModel(
      age: userModel.age,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      email: userModel.email,
      password: userModel.password,
      interests: userModel.interests,
      images: userModel.images,
      gender: _selectedGender ?? userModel.gender,
      sexualOrientation: _selectedSexualOrientation ?? userModel.sexualOrientation,
      preference: _selectedPreference ?? userModel.preference,
    );

    UserDao userDao = UserDao();
    await userDao.signUp(finalUser.email, finalUser.password, finalUser);
  }
  Future<User?> _signInUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'user@example.com',
        password: 'password',
      );
      return userCredential.user;
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    final UserModel newUser = ModalRoute.of(context)!.settings.arguments as UserModel;

    return CustomScaffold(
      appBar: AppBar(
        title: Image.asset('assets/logos/logo.png'),
        backgroundColor: primaryDarkColor,
        foregroundColor: primaryLightColor,
      ),
      body: InkWell(
        onTap: () {
          // Close keyboard when tapping outside of it
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const ProgressBar(currentStep: 4),
              Column(
                children: [
                  Text(
                    "Now set some preferences for your account so we can show you the people you want to see.",
                    style: paragraph_light,
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    iconEnabledColor: primaryLightColor,
                    value: _selectedGender,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Your Gender',
                      hintStyle: _isGenderFocused
                          ? TextStyle(fontSize: 14, color: primaryColor)
                          : paragraph_light,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryLightColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                    items: genders.map((gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender, style: TextStyle(color: _selectedGender == gender ? Colors.white : Colors.black, fontSize: 14)),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    iconEnabledColor: primaryLightColor,
                    value: _selectedSexualOrientation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedSexualOrientation = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Your Sexual Orientation',
                      hintStyle: _isSexualOrientationFocused
                          ? TextStyle(fontSize: 14, color: primaryColor)
                          : paragraph_light,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryLightColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                    items: sexualOrientations.map((orientation) {
                      return DropdownMenuItem<String>(
                        value: orientation,
                        child: Text(orientation, style: TextStyle(color: _selectedSexualOrientation == orientation ? Colors.white : Colors.black, fontSize: 14)),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    iconEnabledColor: primaryLightColor,
                    value: _selectedPreference,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedPreference = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Who do you want to see?',
                      hintStyle: _isPreferenceFocused
                          ? TextStyle(fontSize: 14, color: primaryColor)
                          : paragraph_light,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryLightColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                    items: preferences.map((preference) {
                      return DropdownMenuItem<String>(
                        value: preference,
                        child: Text(preference, style: TextStyle(color: _selectedPreference == preference ? Colors.white : Colors.black, fontSize: 14)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: primaryBtn,
                  onPressed: () async {
                    if (_selectedGender == null || _selectedSexualOrientation == null || _selectedPreference == null) {
                      // Show an error message or handle validation
                      return;
                    }
                    else{
                      await _uploadImagesAndSaveUser(newUser);
                      Navigator.pushNamed(context, '/signup_7');
                    }
                  },
                  child: const Text('Complete'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
