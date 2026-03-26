import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.onTap, required this.text});
  VoidCallback onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: .circular(10),
          color: Colors.deepPurple,
        ),
        child: Center(
          child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }
}
