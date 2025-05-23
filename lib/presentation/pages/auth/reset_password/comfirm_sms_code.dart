import 'package:flutter/material.dart';
import 'package:real_project/bloc/confirm_smscode/comfirm_smscode_bloc.dart';
import 'package:real_project/bloc/login/auth_login_bloc.dart';
import 'package:real_project/core/colors.dart';
import 'package:real_project/core/common_widgets/custom_textfield.dart';
import 'package:real_project/core/imports.dart';
import 'package:real_project/presentation/pages/home_screen.dart';

class ConfirmSmsCode extends StatefulWidget {
  const ConfirmSmsCode({super.key});

  @override
  State<ConfirmSmsCode> createState() => _ConfirmSmsCodeState();
}

class _ConfirmSmsCodeState extends State<ConfirmSmsCode> {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasController = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteGrey2,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Ko'k fon yuqori qismi
          Container(
            height: maxHeight * 0.33,
            decoration: BoxDecoration(color: AppColors.primaryColor),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: maxHeight * 0.25),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 50),
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.emailAddress,
                        labelText: "Email pochtangiz",
                        hintText: "Email pochtangiz",
                        icon: Icons.email_outlined,
                        controller: emailController,
                      ),
                      SizedBox(height: 18),
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.emailAddress,
                        labelText: "Kod",
                        hintText: "Kodni kiriting",
                        icon: Icons.email_outlined,
                        controller: smsCodeController,
                      ),
                      SizedBox(height: 18),
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.emailAddress,
                        labelText: "Yangi parol",
                        hintText: "Yangi parol",
                        icon: Icons.email_outlined,
                        controller: newPasController,
                      ),

                      SizedBox(height: maxHeight * 0.065),
                      BlocConsumer<ComfirmSmscodeBloc, ComfirmSmscodeState>(
                        listener: (context, state) {
                          if (state is ConfirmSmsCodeSuccesState) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ),
                              (route) => false,
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<ComfirmSmscodeBloc>(context).add(
                                ComfirmCodeEmailEvent(
                                  email: emailController.text,
                                  sms_code: smsCodeController.text,
                                  newPassword: newPasController.text,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: Size(maxWidth * 0.8, 60),
                            ),
                            child:
                                state is AuthLoginLoading
                                    ? SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              AppColors.white1,
                                            ),
                                        strokeWidth: 3,
                                      ),
                                    )
                                    : Text(
                                      "Tasdiqlash",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white1,
                                      ),
                                    ),
                          );
                        },
                      ),

                      SizedBox(height: 30),
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
