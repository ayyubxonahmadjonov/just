import 'package:real_project/core/imports.dart';

class CustomTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: iconColor),
        labelText: labelText,
        hintText: hintText,
        filled: true,
        fillColor: color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
