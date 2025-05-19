import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Color color;
  final Color iconColor;

  CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.textInputType,
    required this.color, required this.iconColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(

      keyboardType: widget.textInputType,
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: widget.color,
        filled: true,
        labelText: widget.labelText,
        prefixIcon: Icon(widget.icon),
        prefixIconColor: widget.iconColor,
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
