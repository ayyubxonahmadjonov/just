import 'package:real_project/presentation/view_models/bloc/set_new_password/set_new_password_bloc.dart';

import '../../../../core/constants/app_imports.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGrey2,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            height: 0.22.sh,
            decoration: BoxDecoration(color: AppColors.primaryColor),
          ),

          Padding(
            padding: EdgeInsets.only(top: 110.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: AppColors.white2,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 40.h),

                    /// Email
                    CustomTextField(
                      obscureText: true,
                      iconColor: AppColors.whiteGrey1,
                      color: AppColors.whiteGrey2,
                      textInputType: TextInputType.emailAddress,
                      labelText: "Yangi parol",
                      hintText: "Yangi parolni kiriting",
                      icon: Icons.lock_outline,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Parolni kiriting";
                        } else if (value.length < 8) {
                          return "Parol 8 ta belgidan iborat bo'lishi shart";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 18.h),

                    /// Kod
                    CustomTextField(
                      obscureText: true,
                      iconColor: AppColors.whiteGrey1,
                      color: AppColors.whiteGrey2,
                      textInputType: TextInputType.text,
                      labelText: "Parolni takrorlang",
                      hintText: "Parolni takrorlang",
                      icon: Icons.lock_outline,
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Parolni takrorlang";
                        } else if (value.length < 8) {
                          return "Parol 8 ta belgidan iborat bo'lishi shart";
                        } else {
                          if (value != passwordController.text) {
                            return "Parollar bir-biriga mos emas";
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 0.07.sh),

                    /// Tasdiqlash tugmasi
                    BlocConsumer<SetNewPasswordBloc, SetNewPasswordState>(
                      listener: (context, state) {
                        if (state is SetNewPasswordSuccess) {
                          CustomAwesomeDialog.showPasswordResetSuccess(
                            context: context,
                          );
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final String? resetToken =
                                  await SharedPreferencesHelper().getString(
                                    "reset_token",
                                  );
                              BlocProvider.of<SetNewPasswordBloc>(context).add(
                                SetNewPasswordWithTokenEvent(
                                  reset_token: resetToken.toString(),
                                  new_password: passwordController.text,
                                  confirm_password:
                                      confirmPasswordController.text,
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
                              state is SetNewPasswordLoading
                                  ? SizedBox(
                                    height: 24.h,
                                    width: 24.h,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.white1,
                                      ),
                                      strokeWidth: 3,
                                    ),
                                  )
                                  : Text(
                                    "Parolni saqlash",
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
        ],
      ),
    );
  }
}
