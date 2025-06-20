import '../../core/constants/app_imports.dart';

class MenuItem extends StatefulWidget {
  final String cardNumber;
  final String name;
  final String? iconPath1;
  final String? iconPath2;

  const MenuItem({
    super.key,
    required this.cardNumber,
    required this.name,
    this.iconPath1,
    this.iconPath2,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CopyCardNumberWidget(
            cardNumber: widget.cardNumber,
            name: widget.name,
            iconPath1: widget.iconPath1,
            iconPath2: widget.iconPath2,
          ),
        ),
      ],
    );
  }
}
