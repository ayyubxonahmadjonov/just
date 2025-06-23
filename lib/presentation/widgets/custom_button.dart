import '../../core/constants/app_imports.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Color bacColor;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final double borderRadius;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.bacColor,
    required this.textColor,
    required this.fontWeight,
    required this.fontSize,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,

      style: ElevatedButton.styleFrom(
        minimumSize: Size(widget.width, widget.height),
        backgroundColor: widget.bacColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      child: Text(
        widget.title,
        style: TextStyle(
          color: widget.textColor,
          fontWeight: widget.fontWeight,
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}
