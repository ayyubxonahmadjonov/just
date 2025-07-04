import '../../core/constants/app_imports.dart';

class BuildIconButton extends StatefulWidget {
  final String icon;
  final String label;
  final Widget widget;
  final double dialogWidth;
  final double dialogHeight;

  final Color? color;
  final Color? popColor;
  final Color? iconColor;

  const BuildIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.widget,
    required this.dialogWidth,
    required this.dialogHeight,
    this.color = AppColors.primaryColor,
    this.popColor = AppColors.primaryColor,
    this.iconColor = AppColors.white2,
  });

  @override
  State<BuildIconButton> createState() => _BuildIconButtonState();
}

class _BuildIconButtonState extends State<BuildIconButton> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final Offset buttonPosition = button.localToGlobal(Offset.zero);

        showPopover(
          context: context,
          bodyBuilder: (context) => widget.widget,
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
              icon,
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
