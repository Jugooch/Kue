import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png'),
        backgroundColor: primaryDarkColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Chat Page Content'),
          ],
        ),
      ),
    );
  }
}
