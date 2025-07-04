import 'package:flutter/material.dart';
import 'package:real_project/core/constants/app_imports.dart';

class CustomPopover extends StatefulWidget {
  const CustomPopover({super.key});

  @override
  State<CustomPopover> createState() => _CustomPopoverState();
}

class _CustomPopoverState extends State<CustomPopover> {
  @override
  Widget build(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final Offset buttonPosition = button.localToGlobal(Offset.zero);
        final double buttonHeight = button.size.height;
        final double dialogWidth = maxWidth * 0.93;
        final double dialogHeight = maxHeight * 0.5;

        showPopover(
          context: context,
          bodyBuilder:
              (cmontext) => Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [Text("Tarix")],
              ),

          backgroundColor: AppColors.primaryColor.withOpacity(0.5),
          barrierDismissible: true,
          radius: 30,
          width: dialogWidth,
          height: dialogHeight,
          direction: PopoverDirection.bottom,
          contentDxOffset: (maxWidth - dialogWidth) / 0.4 - buttonPosition.dx,
          contentDyOffset: 10,
        );
      },
    );
  }
}
