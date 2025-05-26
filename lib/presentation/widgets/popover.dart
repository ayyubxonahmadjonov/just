import '../../core/constants/app_imports.dart';

class CustomPopover {
  static OverlayEntry? _overlayEntry;

  static void show({
    required BuildContext context,
    required WidgetBuilder builder,
    required GlobalKey targetKey,
  }) {
    hide(); // oldingi popoverni yopish

    final RenderBox renderBox =
        targetKey.currentContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Tashqariga bosilganda yopish uchun GestureDetector
            Positioned.fill(
              child: GestureDetector(
                onTap: () => hide(),
                behavior: HitTestBehavior.translucent,
                child: Container(),
              ),
            ),

            // Arrow + Popover Box
            Positioned(
              left: position.dx + size.width / 2 - 10,
              top: position.dy + size.height,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Arrow
                    CustomPaint(
                      painter: _ArrowPainter(),
                      child: SizedBox(width: 20, height: 10),
                    ),
                    // Main popover content
                    Container(
                      width: 250,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: builder(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class _ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue.withOpacity(0.9);
    final path =
        Path()
          ..moveTo(0, size.height)
          ..lineTo(size.width / 2, 0)
          ..lineTo(size.width, size.height)
          ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
