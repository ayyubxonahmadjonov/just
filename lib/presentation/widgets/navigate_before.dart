import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigateBefore extends StatelessWidget {
  final Widget? route;

  const NavigateBefore({super.key, this.route});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: InkWell(
          onTap: () {
            if (route != null) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => route!),
                (route) => false,
              );
            } else {
              Navigator.pop(context);
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.navigate_before, color: Colors.white, size: 28.sp),
              SizedBox(width: 4.w),
              Text(
                'Ortga',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
