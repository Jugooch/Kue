import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/models/models.dart'; // Ensure you import your UserModel
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';
import 'dart:io';

class SignupStep5 extends StatefulWidget {
  const SignupStep5({super.key});

  @override
  _SignupStep5State createState() => _SignupStep5State();
}

class _SignupStep5State extends State<SignupStep5> {
  List<File?> selectedImages = List<File?>.filled(5, null);
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImages[index] = File(pickedFile.path);
      });
    }
  }

  Widget _buildImagePicker(int index) {
    return GestureDetector(
      onTap: () => _pickImage(index),
      child: Container(
        width: 84,
        height: 110,
        decoration: BoxDecoration(
          color: primaryLightColor,
          border: Border.all(color: primaryLightColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: selectedImages[index] != null
            ? Image.file(selectedImages[index]!, fit: BoxFit.cover)
            : Icon(Icons.add_a_photo, color: primaryColor),
      ),
    );
  }

  void moveToNext(UserModel userModel) {
    if(selectedImages.length > 2 && selectedImages.length < 6){
    List<String> imagePaths = selectedImages
        .where((file) => file != null)
        .map((file) => file!.path)
        .toList();

    UserModel updatedUser = UserModel(
      age: userModel.age,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      email: userModel.email,
      password: userModel.password,
      interests: userModel.interests,
      images: imagePaths,
      gender: userModel.gender,
      sexualOrientation: userModel.sexualOrientation,
      preference: userModel.preference,
    );

    Navigator.pushNamed(
      context,
      '/signup_6',
      arguments: updatedUser,
    );
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
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const ProgressBar(currentStep: 3),
              Column(
                children: [
                  Text(
                    "Next, you will pick out the images to showcase on your profile. We recommend picking photos of yourself that showcase your personality!",
                    style: paragraph_light
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) => _buildImagePicker(index)),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(2, (index) => _buildImagePicker(index + 3)),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: primaryBtn,
                  onPressed: () {
                    moveToNext(newUser);
                  },
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
