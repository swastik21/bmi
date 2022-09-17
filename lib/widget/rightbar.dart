import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  final rightBarWidth;
  const RightBar({super.key, required this.rightBarWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 30,
          width: rightBarWidth.toDouble(),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
        )
      ],
    );
  }
}
