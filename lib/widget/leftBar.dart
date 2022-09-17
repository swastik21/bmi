import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  final leftBarWidth;
  const LeftBar({super.key, required this.leftBarWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 30,
          width: leftBarWidth.toDouble(),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        )
      ],
    );
  }
}
