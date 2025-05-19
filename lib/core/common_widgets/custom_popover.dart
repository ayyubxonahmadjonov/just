import 'package:flutter/material.dart';
import 'package:real_project/core/common_widgets/custom_copier.dart';
class MenuItem extends StatefulWidget {
  const MenuItem({super.key});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
  
        Center(child: CopyCardNumberWidget(cardNumber: "0000 0000 0000 0000",name: "ILYOSBEK IKROMOV",))
      ],
    );
  }
}
