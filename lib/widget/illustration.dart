import 'package:bmi/widget/leftBar.dart';
import 'package:bmi/widget/rightbar.dart';
import 'package:flutter/material.dart';

class Illustration extends StatelessWidget {
  const Illustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 10,
        ),
        RightBar(rightBarWidth: 20),
        SizedBox(
          height: 10,
        ),
        RightBar(rightBarWidth: 50),
        SizedBox(
          height: 10,
        ),
        RightBar(rightBarWidth: 20),
        SizedBox(
          height: 30,
        ),
        LeftBar(leftBarWidth: 30),
        SizedBox(
          height: 50,
        ),
        LeftBar(leftBarWidth: 30),
      ],
    );
  }
}
