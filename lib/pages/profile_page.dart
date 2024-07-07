import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Profile Page Content'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit_profile');
            },
            child: const Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}
