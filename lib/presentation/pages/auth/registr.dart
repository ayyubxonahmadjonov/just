import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_project/bloc/registr/auth_registr_bloc.dart';
import 'package:real_project/core/colors.dart';
import 'package:real_project/core/common_widgets/custom_textfield.dart';
import 'package:real_project/presentation/pages/error_page.dart';

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
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteGrey2,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background blue top part
          Container(
            height: maxHeight * 0.33,
            decoration: const BoxDecoration(color: Colors.blue),
          ),

          // White card with form on top of blue background
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 50),
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.name,
                        labelText: "Ismingiz",
                        hintText: "Ismingiz",
                        icon: Icons.person,
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ismni kiriting";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
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
                      const SizedBox(height: 18),
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.visiblePassword,
                        labelText: "Parol yarating",
                        hintText: "Parol yarating",
                        icon: Icons.lock,
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return "Kamida 8 ta belgidan iborat parol kiriting";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      CustomTextField(
                        iconColor: AppColors.whiteGrey1,
                        color: AppColors.whiteGrey2,
                        textInputType: TextInputType.visiblePassword,
                        labelText: "Parolni takrorlang",
                        hintText: "Parolni takrorlang",
                        icon: Icons.lock,
                        controller: rePasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return "Parollar mos emas";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 65),
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
                          } else if (state is AuthRegistrError) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const NoconnectionScreen(),
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
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: Size(maxWidth * 0.8, 60),
                            ),
                            child:
                                state is AuthRegistrLoading
                                    ? const SizedBox(
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
                                    : const Text(
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
