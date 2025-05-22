

import '../imports.dart';

class CopyCardNumberWidget extends StatefulWidget {
  final String cardNumber;
  final String name;

  CopyCardNumberWidget({required this.cardNumber, required this.name});

  @override
  State<CopyCardNumberWidget> createState() => _CopyCardNumberWidgetState();
}

class _CopyCardNumberWidgetState extends State<CopyCardNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// CARD NUMBER QATORI
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.cardNumber,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  color: AppColors.white2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: widget.cardNumber));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Card number copied!")),
                  );
                },
                child: ImageIcon(
                  AssetImage("assets/icons/copy.png"),
                  color: AppColors.white2,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Divider(thickness: 1, color: AppColors.white2),
        ),

        SizedBox(height: 20),

        /// NAME QATORI
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  color: AppColors.white2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: widget.name)); // TO‘G‘RILANDI!
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Name copied!")),
                  );
                },
                child: ImageIcon(
                  AssetImage("assets/icons/copy.png"),
                  color: AppColors.white2,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Divider(thickness: 1, color: AppColors.white2),
        ),
      ],
    );
  }
}
