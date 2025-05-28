import '../../../../core/constants/app_imports.dart';

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
    return Scaffold(
      backgroundColor: AppColors.whiteGrey2,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// Yuqori fon qismi (ko'k rang)
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
                  color: AppColors.white2,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 40.h),

                      /// Email
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.emailAddress,
                        labelText: "Email pochtangiz",
                        hintText: "Email pochtangiz",
                        icon: Icons.email_outlined,
                        controller: emailController,
                      ),

                      SizedBox(height: 18.h),

                      /// Kod
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.text,
                        labelText: "Kod",
                        hintText: "Kodni kiriting",
                        icon: Icons.lock_outline,
                        controller: smsCodeController,
                      ),

                      SizedBox(height: 18.h),

                      /// Yangi parol
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.visiblePassword,
                        labelText: "Yangi parol",
                        hintText: "Yangi parol",
                        icon: Icons.lock_outline,
                        controller: newPasController,
                      ),

                      SizedBox(height: 0.07.sh),

                      /// Tasdiqlash tugmasi
                      BlocConsumer<ComfirmSmscodeBloc, ComfirmSmscodeState>(
                        listener: (context, state) {
                          if (state is ConfirmSmsCodeSuccesState) {
                            CustomAwesomeDialog.showPasswordResetSuccess(
                              context: context,
                            );
                          } else if (state is ConfirmSmsCodeErrorState) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        NoconnectionScreen(error: state.error),
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
                                      "Tasdiqlash",
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
