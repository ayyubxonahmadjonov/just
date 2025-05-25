import '../../core/imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 40.w),
              child: Image.asset(
                'assets/images/primary_logo.png',
                // optional: logoni moslashuvchan qilish
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: CustomButton(
                route: RegistrationForm(),
                width: 0.8.sw,
                height: 55.h,
                title: "Ro'yhatdan O'tish",
                bacColor: AppColors.white1,
                textColor: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                borderRadius: 30.r,
              ),
            ),
            SizedBox(height: 15.h),
            CustomButton(
              width: 0.8.sw,
              route: LoginPage(),
              height: 55.h,
              title: "Hisobga kirish",
              bacColor: AppColors.white1,
              textColor: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              borderRadius: 30.r,
            ),
          ],
        ),
      ),
    );
  }
}
