import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_project/bloc/registr/auth_registr_bloc.dart';
import 'package:real_project/core/colors.dart';
import 'package:real_project/core/common_widgets/custom_textfield.dart';

import '../home_screen.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteGrey2,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background blue top part
          Container(
            height: maxHeight * 0.3,
            decoration: BoxDecoration(color: Colors.blue),
          ),

          // White card with form on top of blue background
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Container(
                  height: maxHeight * 0.53,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 55),

                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,

                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.name,
                        labelText: "Ismingiz",
                        hintText: "Ismingiz",
                        icon: Icons.person,
                        controller: nameController,
                      ),
                      SizedBox(height: 18),
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

                        textInputType: TextInputType.visiblePassword,
                        labelText: "Parol yarating",
                        hintText: "Parol yarating",
                        icon: Icons.lock,
                        controller: passwordController,
                      ),
                      SizedBox(height: 18),
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,

                        color: AppColors.whiteGrey2,

                        textInputType: TextInputType.visiblePassword,
                        labelText: "Parolni takrorlang",
                        hintText: "Parolni takrorlang",
                        icon: Icons.lock,
                        controller: rePasswordController,
                      ),
                      SizedBox(height: 65),
                      BlocConsumer<AuthRegistrBloc, AuthRegistrState>(
                        listener: (context, state) {
                          if (state is AuthRegistrSucces) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed:
                                state is AuthRegistrLoading
                                    ? () {} // loader bo‘layotganda bosib bo‘lmaydi
                                    : () {
                                      print('pressed');
                                      BlocProvider.of<AuthRegistrBloc>(
                                        context,
                                      ).add(
                                        RegistrEvent(
                                          name: nameController.text,
                                          gmail: emailController.text,
                                          password: passwordController.text,
                                          rePassword: rePasswordController.text,
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
                                state is AuthRegistrLoading
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
                                      "Ro'yhatdan o'tish",
                                      style: TextStyle(
                                        color: AppColors.white1,
                                        fontSize: 20,
                                      ),
                                    ),
                          );
                        },
                      ),
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
