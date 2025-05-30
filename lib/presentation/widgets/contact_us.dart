import '../../core/constants/app_imports.dart';

class ContactUsPage extends StatefulWidget {
  final String cardNumber;
  final String name;
  final String? iconPath1;
  final String? iconPath2;

  const ContactUsPage({
    super.key,
    required this.cardNumber,
    required this.name,
    this.iconPath1,
    this.iconPath2,
  });

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
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
