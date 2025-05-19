import 'package:flutter/material.dart';
import 'package:real_project/core/colors.dart';
import 'package:real_project/core/common_widgets/custom_button.dart';
import 'package:real_project/core/common_widgets/custom_textfield.dart';

import '../home_screen.dart';

class RegistrationForm extends StatefulWidget {
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
                height: maxHeight*0.53,
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
                      CustomButton(
                        route: HomePage(),

                        title: "Ro'yhatdan o’tish",
                        bacColor: AppColors.primaryColor,
                        textColor: AppColors.white1,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        borderRadius: 30,
                        width: maxWidth * 0.8,
                        height: 60,
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
