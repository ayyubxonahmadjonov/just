import 'package:flutter/material.dart';
import 'package:real_project/core/colors.dart';
import 'package:real_project/core/common_widgets/custom_button.dart';
import 'package:real_project/core/common_widgets/custom_textfield.dart';
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
            decoration: BoxDecoration(
              color: AppColors.primaryColor,

            ),
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
                  key: _formKey,
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
                        textInputType: TextInputType.visiblePassword,
                        labelText: "Parolingiz",
                        hintText: "Parolingiz",
                        icon: Icons.lock,
                        controller: passwordController,
                      ),
                      SizedBox(height: 10),

                      // "Parolni unutdingizmi?" to'g'ri joylashgan
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Parolni unutdingizmi bosilganda
                          },
                          child: Text(
                            "Parolni unutdingizmi?",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      CustomButton(
                        route: HomePage(),
                        title: "Hisobga kirish",
                        bacColor: AppColors.primaryColor,
                        textColor: AppColors.white1,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        borderRadius: 30,
                        width: maxWidth * 0.8,
                        height: 60,
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
