import '../../core/constants/app_imports.dart';

class MenuItem extends StatefulWidget {
  final String cardNumber;
  final String name;
  final String? iconPath1;
  final String? iconPath2;
  final String? phoneNumber;
  final String? username;
  final Widget widget;

  const MenuItem({
    this.phoneNumber,
    this.username,
    super.key,
    required this.cardNumber,
    required this.name,
    this.iconPath1,
    this.iconPath2,
    required this.widget,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: widget.widget)],
    );
  }
}
