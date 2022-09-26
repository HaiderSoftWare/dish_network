import 'package:flutter/material.dart';

class Costum_button extends StatelessWidget {
  String title;
  void Function()? onPressed;
  Costum_button({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 47,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
