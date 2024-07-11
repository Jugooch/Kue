import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kue/styling.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<File?> selectedImages = List<File?>.filled(5, null);

  final ImagePicker _picker = ImagePicker();
  final interests = ['Interest 1', 'Interest 2', 'Interest 3'];

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
    return 
    SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            CircleAvatar(radius:40),
            SizedBox(height: 16),
            Text("User Name", style: header1_light),
            SizedBox(height: 16),
            Text(
                "User bio goes here. It can take up a decent amount of space up to a max of 5 lines probably?", style: paragraph_light, textAlign: TextAlign.center,),
            SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 8.0,
              children: interests.map((interest) {
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: primaryLightColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      interest,
                      style: paragraph_light,
                    ));
              }).toList(),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: primaryBtn,
                onPressed: () {
                  Navigator.pushNamed(context, '/edit_profile');
                },
                child: const Text('Edit Profile'),
              ),
            ),
            SizedBox(height: 16),
            Divider(color: primaryLightColor,),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) => _buildImagePicker(index)),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  List.generate(2, (index) => _buildImagePicker(index + 3)),
            ),
          ],
        ));
  }
}
