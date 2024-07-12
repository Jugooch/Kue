import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/dao/user_dao.dart';
import 'package:kue/styling.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
  List<String> sexualOrientations = [
    'Straight',
    'Gay',
    'Lesbian',
    'Bisexual',
    'Queer',
    'Other'
  ];
  List<String> preferences = ['Men', 'Women', 'Everyone'];

  double _matchDistance = 10;

  String getValueLabel(double value) {
    return "${value.toInt()} miles";
  }

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

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Image.asset('assets/logos/logo.png'),
        backgroundColor: primaryDarkColor,
        foregroundColor: primaryLightColor,
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: success),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text("Want to refer someone you know to use Kue?",
                        style: paragraph_light)),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: primaryBtn,
                    onPressed: () {},
                    child: const Text('Refer User'),
                  ),
                ),
                SizedBox(height: 32),
                Divider(color: primaryLightColor),
                SizedBox(height: 32),
                Center(
                    child: Text("Or you can update your profile preferences below!",
                        style: paragraph_light)),
                        SizedBox(height: 16),
                Text("Gender", style: header5_light),
                SizedBox(height: 8),
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
                      child: Text(gender,
                          style: TextStyle(
                              color: _selectedGender == gender
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14)),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Text("Sexual Orientation", style: header5_light),
                SizedBox(height: 8),
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
                      child: Text(orientation,
                          style: TextStyle(
                              color: _selectedSexualOrientation == orientation
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14)),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Text("Who You Want To See", style: header5_light),
                SizedBox(height: 8),
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
                      child: Text(preference,
                          style: TextStyle(
                              color: _selectedPreference == preference
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14)),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Text("Match Distance", style: header5_light),
                SizedBox(height: 8),
                Slider(
                  value: _matchDistance,
                  min: 10,
                  max: 100,
                  divisions: 3,
                  onChanged: (value) {
                    setState(() {
                      _matchDistance = value;
                    });
                  },
                  label: getValueLabel(_matchDistance),
                ),
                Center(
                  child:
                      Text(getValueLabel(_matchDistance), style: header6_light),
                ),
                SizedBox(height: 32),
                Divider(color: primaryLightColor),
                SizedBox(height: 32),
                Center(
                    child: Text("Have a question or support request?",
                        style: paragraph_light)),
                        SizedBox(height: 16),
                        Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: primaryBtn,
                    onPressed: () {},
                    child: const Text('Go to FAQ/Support'),
                  ),
                ),
                SizedBox(height: 32),
                Divider(color: primaryLightColor),
                SizedBox(height: 32),
                Center(
                    child: Text("Looking to log out or delete your account?",
                        style: paragraph_light)),
                        SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: errorBtn,
                    onPressed: () {
                      UserDao().signOut();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text('Log Out'),
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: errorBtn2,
                    onPressed: () {},
                    child: const Text('Delete Account'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
