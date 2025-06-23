import '../../core/constants/app_imports.dart';

class BuildIconButton extends StatefulWidget {
  final String icon;
  final String label;
  final String cardNumber;
  final String name;
  final String? iconPath1;
  final String? iconPath2;
  final String? phoneNumber;
  final String? username;
  final Color? color;
  final Color? popColor;
  final Color? iconColor;

  final Widget? widget;
  final double dialogWidth;
  final double dialogHeight;

  const BuildIconButton({
    this.iconColor = AppColors.white2,
    required this.dialogWidth,
    required this.dialogHeight,
    this.color = AppColors.primaryColor,
    this.popColor = AppColors.primaryColor,

    this.widget,
    super.key,
    required this.icon,
    required this.label,
    required this.cardNumber,
    required this.name,
    this.iconPath1,
    this.iconPath2,
    this.phoneNumber,
    this.username,
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

        showPopover(
          context: context,
          bodyBuilder: (context) => widget.widget!,

          backgroundColor: widget.popColor!,
          barrierDismissible: true,
          radius: 30,
          width: widget.dialogWidth,
          height: widget.dialogHeight,
          direction: PopoverDirection.bottom,
          contentDxOffset:
              (maxWidth - widget.dialogWidth) / 0.4 - buttonPosition.dx,
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
            color: widget.color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(13.0.w),
            child: SvgPicture.asset(
              "$icon",
              width: 30,
              height: 30,
              color: widget.iconColor,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(
            color: widget.color,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
