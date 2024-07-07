import 'package:flutter/material.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Matches Page Content'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/chat');
            },
            child: const Text('Go to Chat'),
          ),
        ],
      ),
    );
  }
}
