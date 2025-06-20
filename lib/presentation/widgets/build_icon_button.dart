import '../../core/constants/app_imports.dart';

class BuildIconButton extends StatefulWidget {
  final String icon;
  final String label;
  final String cardNumber;
  final String name;
  final String? iconPath1;
  final String? iconPath2;

  const BuildIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.cardNumber,
    required this.name,
    this.iconPath1,
    this.iconPath2,
  });
  @override
  State<BuildIconButton> createState() => _BuildIconButtonState();
}

class _BuildIconButtonState extends State<BuildIconButton> {
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
              (context) => MenuItem(
                cardNumber: widget.cardNumber,
                name: widget.name,
                iconPath1: widget.iconPath1,
                iconPath2: widget.iconPath2,
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
      child: _buildIconButton('assets/icons/${widget.icon}', widget.label),
    );
  }

  Widget _buildIconButton(String icon, String label) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(13.0.w),
            child: SvgPicture.asset("$icon", width: 30, height: 30),
          ),
        ),
        SizedBox(height: 8.h),
        Text(label),
      ],
    );
  }
}
