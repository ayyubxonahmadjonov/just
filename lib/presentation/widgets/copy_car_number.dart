import '../../core/constants/app_imports.dart';

class CustomCopier extends StatefulWidget {
  final String cardNumber;
  final String name;

  const CustomCopier({super.key, required this.cardNumber, required this.name});

  @override
  State<CustomCopier> createState() => _CustomCopierState();
}

class _CustomCopierState extends State<CustomCopier> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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

            SizedBox(width: 10),

            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: widget.cardNumber));
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Card number copied!")));
              },
              child: ImageIcon(
                AssetImage("assets/icons/copy.png"),
                color: AppColors.white2,
                size: 25,
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Divider(thickness: 1, color: AppColors.white2),
        ),
      ],
    );
  }
}
