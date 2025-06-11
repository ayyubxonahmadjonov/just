import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextInputType textInputType;
  final Color iconColor;
  final Color color;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  const CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.textInputType,
    required this.iconColor,
    required this.color,
    required this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: _isObscured,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: widget.iconColor),
        labelText: widget.labelText,
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: widget.iconColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
                : null,
      ),
    );
  }
}
