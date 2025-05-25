import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_project/bloc/registr/auth_registr_bloc.dart';
import 'package:real_project/core/colors.dart';
import 'package:real_project/core/common_widgets/custom_textfield.dart';
import 'package:real_project/presentation/pages/error_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_screen.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGrey2,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Blue upper background
          Container(
            height: 0.33.sh,
            decoration: const BoxDecoration(color: Colors.blue),
          ),

          // White form card
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.r),
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
                        textInputType: TextInputType.name,
                        labelText: "Ismingiz",
                        hintText: "Ismingiz",
                        icon: Icons.person,
                        controller: nameController,
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? "Ismni kiriting"
                                    : null,
                      ),
                      SizedBox(height: 18.h),
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
                        labelText: "Parol yarating",
                        hintText: "Parol yarating",
                        icon: Icons.lock,
                        controller: passwordController,
                        obscureText: true,
                        validator:
                            (value) =>
                                value == null || value.length < 8
                                    ? "Kamida 8 ta belgidan iborat parol kiriting"
                                    : null,
                      ),
                      SizedBox(height: 18.h),
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.visiblePassword,
                        labelText: "Parolni takrorlang",
                        hintText: "Parolni takrorlang",
                        icon: Icons.lock,
                        controller: rePasswordController,
                        obscureText: true,
                        validator:
                            (value) =>
                                value != passwordController.text
                                    ? "Parollar mos emas"
                                    : null,
                      ),
                      SizedBox(height: 50.h),
                      BlocConsumer<AuthRegistrBloc, AuthRegistrState>(
                        listener: (context, state) {
                          if (state is AuthRegistrSucces) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => HomePage()),
                              (route) => false,
                            );
                          } else if (state is AuthRegistrError) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) =>
                                        NoconnectionScreen(error: state.error),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed:
                                state is AuthRegistrLoading
                                    ? null
                                    : () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<AuthRegistrBloc>(
                                          context,
                                        ).add(
                                          RegistrEvent(
                                            name: nameController.text.trim(),
                                            email: emailController.text.trim(),
                                            password: passwordController.text,
                                            rePassword:
                                                rePasswordController.text,
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
                                state is AuthRegistrLoading
                                    ? SizedBox(
                                      height: 24.h,
                                      width: 24.h,
                                      child: const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              AppColors.white1,
                                            ),
                                        strokeWidth: 3,
                                      ),
                                    )
                                    : Text(
                                      "Ro'yhatdan o'tish",
                                      style: TextStyle(
                                        color: AppColors.white1,
                                        fontSize: 20.sp,
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
