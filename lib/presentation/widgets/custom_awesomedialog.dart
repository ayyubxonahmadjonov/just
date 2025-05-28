import '../../core/constants/app_imports.dart';

class CustomAwesomeDialog {
  static void showPasswordResetSuccess({required BuildContext context}) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: "Parol yangilandi",
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      desc:
          "Parolingiz muvoffaqiyatli yangilandi. Iltimos, qayta tizimga kiring.",
      btnOkText: "OK",

      btnCancelText: "Bekor qilish",
      btnOkColor: Colors.green,
      btnCancelOnPress: () {
        _navigateToLogin(context);
      },
      btnOkOnPress: () {
        _navigateToLogin(context);
      },
    ).show();
  }

  static void _navigateToLogin(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => LoginPage()),
      (route) => false,
    );
  }
}
