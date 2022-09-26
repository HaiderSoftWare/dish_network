import 'package:flutter/material.dart';

class Costum_feild extends StatelessWidget {
  TextEditingController controller;
  String labelText;

  Costum_feild({super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 18),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }
}
