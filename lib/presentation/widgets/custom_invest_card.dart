import 'package:real_project/core/constants/app_imports.dart';

class CustomInvestCard extends StatefulWidget {
  final String amount;
  final String title;

  const CustomInvestCard({
    super.key,
    required this.amount,
    required this.title,
  });

  @override
  State<CustomInvestCard> createState() => _CustomInvestCardState();
}

class _CustomInvestCardState extends State<CustomInvestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 90.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.amount,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            widget.title,
            style: TextStyle(color: Colors.black54, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
