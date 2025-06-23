import 'package:real_project/core/constants/app_imports.dart';
import 'package:real_project/presentation/pages/income/add_income.dart';
import 'package:real_project/presentation/pages/income/income_history.dart';

class IncomEHistoryPage extends StatefulWidget {
  const IncomEHistoryPage({super.key});

  @override
  State<IncomEHistoryPage> createState() => _IncomEHistoryPageState();
}

class _IncomEHistoryPageState extends State<IncomEHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white2),
        backgroundColor: AppColors.primaryColor,
        centerTitle: false,
        title: Text(
          "Ortga",
          style: TextStyle(
            color: AppColors.white2,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 60.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildIconButton(
                iconColor: AppColors.primaryColor,

                dialogWidth: maxWidth * 0.93,
                dialogHeight: maxHeight * 0.63,
                popColor: AppColors.white2,

                color: AppColors.white2,
                widget: IncomeHistoryScreen(),
                icon: "income_history.svg",
                label: "Tarix",
                cardNumber: "4998930008164513",
                name: "Ilyosbek Ikromov",
              ),
              BuildIconButton(
                iconColor: AppColors.primaryColor,
                dialogWidth: maxWidth * 0.93,
                dialogHeight: maxHeight * 0.4,
                popColor: AppColors.white2,

                color: AppColors.white2,

                widget: AddTransactionScreen(),
                icon: "add_income.svg",
                label: "Qo'shish",
                cardNumber: "4998930008164513",
                name: "Ilyosbek Ikromov",
              ),
              BuildIconButton(
                iconColor: AppColors.primaryColor,

                dialogWidth: maxWidth * 0.93,
                dialogHeight: maxHeight * 0.5,
                popColor: AppColors.white2,
                color: AppColors.white2,

                widget: IncomeHistoryScreen(),
                icon: "statistics.svg",
                label: "Statistika",
                cardNumber: "4998930008164513",
                name: "Ilyosbek Ikromov",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
