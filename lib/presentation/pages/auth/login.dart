import 'package:real_project/core/common_widgets/custom_textfield.dart';
import 'package:real_project/core/imports.dart';
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
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<AuthLoginBloc>(context).add(
                                LoginEvent(
                                  gmail: emailController.text,
                                  password: passwordController.text,
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
                                      "Hisobga kirish",
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
