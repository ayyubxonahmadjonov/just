import 'package:real_project/core/constants/app_imports.dart';

class SetPassword extends StatefulWidget {
  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  List<String> code = ["", "", "", ""];
  final String appPassword =
      SharedPreferencesHelper().getString("app_password") ?? "";

  void _onKeyTap(String value) {
    setState(() {
      int emptyIndex = code.indexWhere((digit) => digit.isEmpty);
      if (emptyIndex != -1 && value.isNotEmpty) {
        code[emptyIndex] = value;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      int lastFilledIndex = code.lastIndexWhere((digit) => digit.isNotEmpty);
      if (lastFilledIndex != -1) {
        code[lastFilledIndex] = "";
      }
    });
  }

  void _onSubmit() {
    final enteredCode = code.join();
    if (appPassword.isEmpty) {
      if (enteredCode.length < 4) {
        _showSnackBar("Iltimos, kamida 4 ta raqam kiriting!");
      } else if (enteredCode.isNotEmpty) {
        SharedPreferencesHelper().setString("app_password", enteredCode);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        _showSnackBar("Iltimos, kamida bitta raqam kiriting!");
      }
    } else {
      if (enteredCode.length < 4) {
        _showSnackBar("Iltimos, kamida 4 ta raqam kiriting!");
      } else if (enteredCode == appPassword) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        _showSnackBar("Kod noto'g'ri kiritildi!");
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 600),
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Text(
              appPassword.isEmpty
                  ? "Iltimos ekran ilovasi uchun \n kod yarating"
                  : "Kirish kodini kiriting",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white2,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  code.asMap().entries.map((entry) {
                    int index = entry.key;
                    String digit = entry.value;
                    return Container(
                      width: 40,
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            digit,
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(height: 5.h),
                          Container(height: 2, color: Colors.white),
                        ],
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 60.h),
            CustomButton(
              onPressed: () => _onSubmit(),
              title: "Tasdiqlash",
              bacColor: AppColors.white1,
              textColor: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              borderRadius: 30,
              width: 0.7.sw,
              height: 55.h,
            ),
            SizedBox(height: 20),
            _buildKeypad(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    final keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['', '0', '⌫'],
    ];

    return Column(
      children:
          keys.map((row) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  row.map((key) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        print('Code: $code');
                        if (key == '⌫') {
                          _onBackspace();
                        } else if (key.isNotEmpty) {
                          _onKeyTap(key);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          key,
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            );
          }).toList(),
    );
  }
}
