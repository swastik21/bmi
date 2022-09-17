import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeumorphicInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  const NeumorphicInput({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(-2, -2),
          ),
          const BoxShadow(
            color: Colors.black,
            offset: Offset(2, 2),
            blurRadius: 6,
            spreadRadius: 1,
          )
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      width: 130,
      child: TextField(
        cursorHeight: 40,
        cursorColor: Colors.grey,
        showCursor: true,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
        textAlign: TextAlign.center,
        controller: controller,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 35,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey.shade300,
          ),
          hintText: hintText!.isNotEmpty ? hintText : "Text",
        ),
      ),
    );
  }
}
