import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';
import 'dart:io';

class SignupStep5 extends StatefulWidget {
  const SignupStep5({super.key});

  @override
  _SignupStep5State createState() => _SignupStep5State();
}

class _SignupStep5State extends State<SignupStep5> {

  List<String> selectedInterests = [];
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
          // Close keyboard when tapping outside of it
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
                    "Now let’s learn a little more about you. Hobbies/Interests are the main way Kue connects you with people. With this in mind, please select at between 3 to 5 interests/hobbies that you love.",
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
                    Navigator.pushNamed(context, '/signup_6');
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
