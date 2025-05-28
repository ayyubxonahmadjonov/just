import '../../core/constants/app_imports.dart';

class BuildIconButton extends StatefulWidget {
  final String icon;
  final String label;

  const BuildIconButton({super.key, required this.icon, required this.label});
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
          bodyBuilder: (context) => MenuItem(),

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
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ImageIcon(AssetImage(icon), color: Colors.white, size: 28),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
