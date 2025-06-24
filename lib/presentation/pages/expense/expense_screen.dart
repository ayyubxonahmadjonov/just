import 'package:real_project/core/constants/app_imports.dart';
import 'package:real_project/presentation/pages/expense/add_expense.dart';
import 'package:real_project/presentation/pages/expense/expense_history.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
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
                dialogWidth: maxWidth * 0.93,
                dialogHeight: maxHeight * 0.63,
                popColor: AppColors.white2,
                iconColor: AppColors.red,

                color: AppColors.white2,
                widget: ExpenseHistoryScreen(),
                icon: "income_history.svg",
                label: "Tarix",
              ),
              BuildIconButton(
                iconColor: AppColors.red,

                dialogWidth: maxWidth * 0.93,
                dialogHeight: maxHeight * 0.4,
                popColor: AppColors.white2,

                color: AppColors.white2,
                widget: AddExpenseScreen(),
                icon: "add_income.svg",
                label: "Qo'shish",
              ),
              BuildIconButton(
                iconColor: AppColors.red,

                dialogWidth: maxWidth * 0.93,
                dialogHeight: maxHeight * 0.5,
                popColor: AppColors.white2,
                color: AppColors.white2,

                widget: ExpenseHistoryScreen(),
                icon: "statistics.svg",
                label: "Statistika",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
