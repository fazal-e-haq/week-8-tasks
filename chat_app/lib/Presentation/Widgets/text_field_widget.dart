import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
  });
  // GlobalKey<State> formValidator;
  TextEditingController controller;
  String hintText;
  Icon prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // validator: formValidator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: .circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(strokeAlign: 3),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
