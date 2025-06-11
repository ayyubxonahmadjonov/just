import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:real_project/core/constants/app_imports.dart';
import 'package:real_project/presentation/pages/auth/reset_password/verify_sms_code.dart';
import 'package:real_project/presentation/widgets/custom_appbar.dart';

class ResetPasswordEmail extends StatefulWidget {
  const ResetPasswordEmail({super.key});

  @override
  _ResetPasswordEmailState createState() => _ResetPasswordEmailState();
}

class _ResetPasswordEmailState extends State<ResetPasswordEmail> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(route: LoginPage()),
      backgroundColor: AppColors.whiteGrey2,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: 0.22.sh,
            decoration: BoxDecoration(color: AppColors.primaryColor),
          ),
          Padding(
            padding: EdgeInsets.only(top: 120.h),
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
                    SizedBox(height: 30.h),

                    Text(
                      "Ilovadan ro'yxatdan o'tgan  \n  telefon raqamini kiriting",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteGrey1,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    IntlPhoneField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,

                        fillColor: AppColors.whiteGrey2,
                        labelText: 'Telefon raqamingiz',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      initialCountryCode: 'UZ',
                      onChanged: (phone) {
                        phoneController.text = phone.completeNumber;
                      },
                    ),

                    SizedBox(height: 50.h),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    OtpPage(phone: phoneController.text),
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
                        "Kodni olish",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white1,
                        ),
                      ),
                    ),

                    // BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
                    //   listener: (context, state) {
                    //     if (state is ResetPasswordSuccesState) {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => ConfirmSmsCode(),
                    //         ),
                    //       );
                    //     } else if (state is ResetPasswordErrorState) {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder:
                    //               (context) =>
                    //                   NoconnectionScreen(error: state.error),
                    //         ),
                    //       );
                    //     }
                    //   },
                    //   builder: (context, state) {
                    //     bool isLoading = state is ResetPasswordLoadingState;

                    //     return ElevatedButton(
                    //       onPressed:
                    //           isLoading
                    //               ? null
                    //               : () {
                    //                 if (_formKey.currentState!.validate()) {
                    //                   BlocProvider.of<ResetPasswordBloc>(
                    //                     context,
                    //                   ).add(
                    //                     ResetPasswordbyEmailEvent(
                    //                       email: phoneController.text,
                    //                     ),
                    //                   );
                    //                 }
                    //               },
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor:
                    //             isLoading
                    //                 ? AppColors.primaryColor.withOpacity(0.6)
                    //                 : AppColors.primaryColor,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(30.r),
                    //         ),
                    //         minimumSize: Size(0.8.sw, 55.h),
                    //       ),
                    //       child:
                    //           isLoading
                    //               ? SizedBox(
                    //                 height: 24.h,
                    //                 width: 24.h,
                    //                 child: CircularProgressIndicator(
                    //                   strokeWidth: 2.5,
                    //                   valueColor:
                    //                       AlwaysStoppedAnimation<Color>(
                    //                         AppColors.white1,
                    //                       ),
                    //                 ),
                    //               )
                    //               : Text(
                    //                 "Kodni olish",
                    //                 style: TextStyle(
                    //                   fontSize: 20.sp,
                    //                   fontWeight: FontWeight.w600,
                    //                   color: AppColors.white1,
                    //                 ),
                    //               ),
                    //     );

                    //   },
                    // ),
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
