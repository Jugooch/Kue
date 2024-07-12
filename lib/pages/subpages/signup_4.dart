import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/models/models.dart';
import 'package:kue/styling.dart';
import 'package:kue/widgets/progress_bar.dart';

class SignupStep4 extends StatefulWidget {
  const SignupStep4({super.key});

  @override
  _SignupStep4State createState() => _SignupStep4State();
}

class _SignupStep4State extends State<SignupStep4> {
  final interests = [
    'Tech',
    'Reading',
    'Movies',
    'TV Shows',
    'Anime',
    'Manga',
    'Cosplay',
    'Video Games',
    'Board Games',
    'Tabletop RPGs',
    'Streaming',
    'Podcasting',
    'Art',
    'Writing',
    'Sports',
    'Music'
  ];

  List<String> selectedInterests = [];

  void toggleSelection(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        if (selectedInterests.length < 5) {
          selectedInterests.add(interest);
        }
      }
    });
  }

  void moveToNext(UserModel userModel){
    if(selectedInterests.length > 2 && selectedInterests.length < 6){
      UserModel newUser = UserModel(age: userModel.age, firstName: userModel.firstName, lastName: userModel.lastName, email: userModel.email, password: userModel.password, interests: selectedInterests, images: [],  gender: '', sexualOrientation: '', preference: '');

      print("Setup page 4, successfully entered info, moving to step 5");
      Navigator.pushNamed(
      context,
      '/signup_5',
      arguments: newUser,
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
          // Close keyboard when tapping outside of it
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const ProgressBar(currentStep: 2),
              Column(
                children: [
                  Text(
                      "Now let’s learn a little more about you. Hobbies/Interests are the main way Kue connects you with people. With this in mind, please select at between 3 to 5 interests/hobbies that you love.",
                      style: paragraph_light),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: interests.map((interest) {
                      bool isSelected = selectedInterests.contains(interest);
                      return GestureDetector(
                        onTap: () => toggleSelection(interest),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? primaryLightColor
                                : Colors.transparent,
                            border: Border.all(
                                color: isSelected
                                    ? primaryColor
                                    : primaryLightColor,
                                width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(interest,
                              style: isSelected
                                  ? TextStyle(color: primaryColor)
                                  : paragraph_light),
                        ),
                      );
                    }).toList(),
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
