import '../../core/imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: maxHeight * 0.1,
              horizontal: maxWidth * 0.1,
            ),
            child: Image.asset('assets/images/primary_logo.png'),
          ),

          Padding(
            padding: EdgeInsets.only(top: maxHeight * 0.1),
            child: CustomButton(
              route: RegistrationForm(),
              width: maxWidth * 0.8,
              height: 60,
              title: "Ro'yhatdan O'tish",
              bacColor: AppColors.white1,
              textColor: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              borderRadius: 30,
            ),
          ),

          SizedBox(height: 15),
          CustomButton(
            width: maxWidth * 0.8,
            route: LoginPage(),
            height: 60,
            title: "Hisobga kirish",
            bacColor: AppColors.white1,
            textColor: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            borderRadius: 30,
          ),
        ],
      ),
    );
  }
}
