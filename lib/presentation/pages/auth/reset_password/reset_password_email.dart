import 'package:real_project/bloc/reset_password/reset_password_bloc.dart';
import 'package:real_project/core/common_widgets/custom_textfield.dart';
import 'package:real_project/core/imports.dart';
import 'package:real_project/presentation/pages/auth/reset_password/comfirm_sms_code.dart';
import 'package:real_project/presentation/pages/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordEmail extends StatefulWidget {
  @override
  _ResetPasswordEmailState createState() => _ResetPasswordEmailState();
}

class _ResetPasswordEmailState extends State<ResetPasswordEmail> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGrey2,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Yuqori qismdagi ko'k fon
          Container(
            height: 280.h,
            decoration: BoxDecoration(color: AppColors.primaryColor),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 220.h),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 40.h),

                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.emailAddress,
                        labelText: "Email pochtangiz",
                        hintText: "Email pochtangiz",
                        icon: Icons.email_outlined,
                        controller: emailController,
                      ),

                      SizedBox(height: 50.h),

                      BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
                        listener: (context, state) {
                          if (state is ResetPasswordSuccesState) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConfirmSmsCode(),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<ResetPasswordBloc>(context).add(
                                ResetPasswordbyEmailEvent(
                                  email: emailController.text,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              minimumSize: Size(0.8.sw, 55.h),
                            ),
                            child: Text(
                              "Kod yuborish",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white1,
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
