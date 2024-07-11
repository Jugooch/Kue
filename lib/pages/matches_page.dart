import 'package:flutter/material.dart';
import 'package:kue/styling.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 16),
              child: Text("New Matches", style: header5_light),
            ),
            SizedBox(height: 16),
            //insert horizontal list of matches here that a user has not messaged yet, each one can be clicked to start a chat with that user.
            Row(children: [])
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 16),
              child: Text("Chats", style: header5_light),
            ),
            SizedBox(height: 16),
            //insert vertical list of chats here, each one can be clicked to link to that specific chat
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [])
          ]),
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
