// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bmi/widget/leftBar.dart';
import 'package:bmi/widget/rightbar.dart';
import 'package:flutter/material.dart';

class Illustration extends StatelessWidget {
  const Illustration({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: _screenSize.height * 0.03,
        ),
        RightBar(rightBarWidth: _screenSize.width * 0.06),
        SizedBox(
          height: _screenSize.height * 0.03,
        ),
        RightBar(rightBarWidth: _screenSize.width * 0.15),
        SizedBox(
          height: _screenSize.height * 0.03,
        ),
        RightBar(rightBarWidth: _screenSize.width * 0.06),
        SizedBox(
          height: _screenSize.height * 0.03,
        ),
        LeftBar(leftBarWidth: _screenSize.width * 0.09),
        SizedBox(
          height: _screenSize.height * 0.03,
        ),
        LeftBar(leftBarWidth: _screenSize.width * 0.09),
      ],
    );
  }
}
