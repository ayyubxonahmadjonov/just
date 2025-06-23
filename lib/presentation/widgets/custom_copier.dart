import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_imports.dart';

class CopyCardNumberWidget extends StatefulWidget {
  final String cardNumber;
  final String name;
  final String? iconPath1;
  final String? iconPath2;
  final String? phoneNumber;
  final String? username;

  CopyCardNumberWidget({
    this.username,
    this.phoneNumber,
    required this.cardNumber,
    required this.name,
    this.iconPath1,
    this.iconPath2,
  });

  @override
  State<CopyCardNumberWidget> createState() => _CopyCardNumberWidgetState();
}

class _CopyCardNumberWidgetState extends State<CopyCardNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// CARD NUMBER QATORI
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              if (widget.iconPath1 != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    widget.iconPath1!,
                    color: AppColors.white2,
                    height: 24,
                    width: 24,
                  ),
                ),
              SizedBox(width: 10.w),

              /// CARD NUMBER TEXT
              Expanded(
                child: InkWell(
                  onTap: () async {
                    await launchUrl(
                      Uri.parse("tel:+998880090799"),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                    widget.cardNumber,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.5,
                      color: AppColors.white2,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              /// COPY ICON
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: widget.cardNumber));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Card number copied!")),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: ImageIcon(
                    AssetImage("assets/icons/copy.png"),
                    color: AppColors.white2,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Divider(thickness: 1, color: AppColors.white2),
        ),

        SizedBox(height: 16.h),

        /// NAME QATORI
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              if (widget.iconPath2 != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    widget.iconPath2!,
                    color: AppColors.white2,
                    height: 24,
                    width: 24,
                  ),
                ),
              SizedBox(width: 10.w),

              /// NAME TEXT
              Expanded(
                child: InkWell(
                  onTap: () {
                    launchUrl(
                      Uri.parse("https://t.me/MOHIRA_ADMINSTRATOR"),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.5,
                      color: AppColors.white2,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              /// COPY ICON
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: widget.name));
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Name copied!")));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: ImageIcon(
                    AssetImage("assets/icons/copy.png"),
                    color: AppColors.white2,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Divider(thickness: 1, color: AppColors.white2),
        ),
      ],
    );
  }
}
