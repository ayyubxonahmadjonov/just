import 'package:real_project/core/constants/app_imports.dart';
import 'package:real_project/presentation/widgets/custom_appbar.dart';

class OtpPage extends StatefulWidget {
  final String phone;
  OtpPage({required this.phone});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List<String> code = ["", "", "", "", ""];

  void _onKeyTap(String value) {
    setState(() {
      for (int i = 0; i < code.length; i++) {
        if (code[i].isEmpty) {
          code[i] = value;
          break;
        }
      }
    });
  }

  void _onBackspace() {
    setState(() {
      for (int i = code.length - 1; i >= 0; i--) {
        if (code[i].isNotEmpty) {
          code[i] = "";
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final phoneMasked = widget.phone.replaceRange(
      6,
      widget.phone.length - 1,
      " *** ** *",
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(route: ResetPasswordEmail()),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Text(
              "$phoneMasked raqamiga \nyuborilgan kodni kiriting",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white2,
                fontSize: 20,
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
              route: NewPassword(),
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
