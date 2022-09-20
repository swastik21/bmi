// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeumorphicInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? unit;
  const NeumorphicInput(
      {super.key, required this.controller, this.hintText, this.unit});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 6,
            offset: const Offset(-2, -2),
          ),
          const BoxShadow(
            color: Colors.black,
            offset: Offset(2, 2),
            blurRadius: 6,
          )
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      width: _screenSize.width * 0.4,
      child: Stack(
        children: [
          TextField(
            cursorHeight: 30,
            cursorColor: Colors.grey,
            showCursor: true,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
            ],
            textAlign: TextAlign.center,
            controller: controller,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: (_screenSize.width + _screenSize.height) * 0.025,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.grey.shade300,
              ),
              hintText: hintText!.isNotEmpty ? hintText : "Text",
            ),
          ),
          Positioned(
            bottom: 15,
            left: 105,
            child: Text(
              unit!,
              style: TextStyle(color: Colors.grey.shade300),
            ),
          )
        ],
      ),
    );
  }
}
