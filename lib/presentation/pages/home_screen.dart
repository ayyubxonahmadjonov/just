import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_project/bloc/profile/get_profile_bloc.dart';
import '../../core/imports.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetProfileBloc>(context).add(GetProfileDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<GetProfileBloc, GetProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetProfileSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 1.sw,
                    height: 0.37.sh,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.r),
                        bottomRight: Radius.circular(40.r),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: 24.w,
                      right: 24.w,
                      top: 60.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Salom ${state.user.firstName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                            Image.asset(
                              'assets/images/app_logo.png',
                              height: 40.h,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Jami sarmoya",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          state.user.totalBalance.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.18.sw),
                          child: Divider(color: AppColors.white1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  state.user.phpInvestBalance.toString(),
                                  style: TextStyle(
                                    color: AppColors.white1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  "PHP invest",
                                  style: TextStyle(
                                    color: AppColors.white1,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  state.user.phpReitBalance.toString(),
                                  style: TextStyle(
                                    color: AppColors.white1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  "Prime capital",
                                  style: TextStyle(
                                    color: AppColors.white1,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BuildIconButton(icon: "invest.png", label: "Invest"),
                          BuildIconButton(icon: "history.png", label: "Tarix"),
                          BuildIconButton(icon: "contact.png", label: "Aloqa"),
                        ],
                      ),
                      Container(
                        width: 0.85.sw,
                        margin: EdgeInsets.only(top: 40.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 4,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 15.h,
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/rectangular1.png'),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "PHP invest",
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/rectangular2.png'),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "Prime Capital",
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                "assets/images/Statistic.png",
                                width: 0.85.sw,
                              ),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is GetProfileLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Something wrong"));
          }
        },
      ),
    );
  }

  Widget _buildInvestCard(String title, String amount) {
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
            amount,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: 4.h),
          Text(title, style: TextStyle(color: Colors.black54, fontSize: 13.sp)),
        ],
      ),
    );
  }
}
