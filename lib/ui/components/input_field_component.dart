import 'package:flutter/material.dart';

class InputFieldComponent extends StatelessWidget {
  const InputFieldComponent({
    required this.controller,
    required this.hintText,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(
            Icons.lock_open,
            color: Colors.orangeAccent,
          ),
        ),
        SizedBox(
          width: 250,
          height: 60,
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
