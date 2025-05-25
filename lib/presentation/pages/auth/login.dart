import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_project/core/common_widgets/custom_textfield.dart';
import 'package:real_project/core/imports.dart';
import 'package:real_project/presentation/pages/auth/reset_password/reset_password_email.dart';
import 'package:real_project/presentation/pages/error_page.dart';
import 'package:real_project/presentation/pages/home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          // Yuqori fon
          Container(
            height: 0.33.sh,
            decoration: BoxDecoration(color: AppColors.primaryColor),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 0.25.sh),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.all(24.r),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Emailni kiriting";
                          } else if (!value.contains("@")) {
                            return "Email noto‘g‘ri formatda";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 18.h),
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.visiblePassword,
                        labelText: "Parolingiz",
                        hintText: "Parolingiz",
                        icon: Icons.lock,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Parolni kiriting";
                          }
                          if (value.length < 8) {
                            return "Parol 8 ta belgidan iborat bo'lishi shart";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 10.h),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPasswordEmail(),
                              ),
                            );
                          },
                          child: Text(
                            "Parolni unutdingizmi?",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30.h),
                      BlocConsumer<AuthLoginBloc, AuthLoginState>(
                        listener: (context, state) {
                          if (state is AuthLoginSucces) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ),
                              (route) => false,
                            );
                          } else if (state is AuthLoginError) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return NoconnectionScreen(error: state.error);
                                },
                              ),
                              (route) => false,
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed:
                                state is AuthLoginLoading
                                    ? null
                                    : () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<AuthLoginBloc>(
                                          context,
                                        ).add(
                                          LoginEvent(
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                          ),
                                        );
                                      }
                                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              minimumSize: Size(0.8.sw, 55.h),
                            ),
                            child:
                                state is AuthLoginLoading
                                    ? SizedBox(
                                      height: 24.h,
                                      width: 24.h,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              AppColors.white1,
                                            ),
                                        strokeWidth: 3,
                                      ),
                                    )
                                    : Text(
                                      "Hisobga kirish",
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
