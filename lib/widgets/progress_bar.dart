import 'package:flutter/material.dart';
import 'package:kue/styling.dart';

class ProgressBar extends StatelessWidget {
  final int currentStep;

  const ProgressBar({Key? key, required this.currentStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return Expanded(
          child: Column(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: index < currentStep ? primaryColor : primaryLightColor,
              ),
            ],
          ),
        );
      }),
    ));
  }
}