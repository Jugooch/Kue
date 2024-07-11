import 'package:flutter/material.dart';
import 'package:kue/styling.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const CustomScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: appBar != null
          ? PreferredSize(
              preferredSize: appBar!.preferredSize,
              child: Container(
                color: Colors.transparent,
                child: appBar,
              ),
            )
          : null,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          body,
        ],
      ),
      bottomNavigationBar: bottomNavigationBar != null
          ? Container(
              color: primaryDarkColor,
              child: bottomNavigationBar,
            )
          : null,
      floatingActionButton: floatingActionButton,
    );
  }
}
