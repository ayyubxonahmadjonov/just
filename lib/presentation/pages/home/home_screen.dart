import 'package:real_project/presentation/pages/expense/expense_screen.dart';
import 'package:real_project/presentation/pages/income/income_screen.dart';
import 'package:real_project/presentation/view_models/bloc/expense/create_expense/create_expense_bloc.dart';
import 'package:real_project/presentation/view_models/bloc/expense/get_expense/get_expense_bloc.dart';
import 'package:real_project/presentation/view_models/bloc/create_income/create_income_bloc.dart';
import 'package:real_project/presentation/view_models/bloc/get_income/get_income_list_bloc.dart';

import '../../../core/constants/app_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentYear = DateTime.now().year;
  final currentMonth = DateTime.now().month;
  final currentDay = DateTime.now().day;
  @override
  void initState() {
    super.initState();

    for (int m = 1; m <= currentMonth; m++) {
      final key = "${currentYear}-${m.toString().padLeft(2, '0')}";
      if (!HiveBoxes.monthly_capitals.containsKey(key)) {
        HiveBoxes.monthly_capitals.put(key, 0.0);
      }
      if (!HiveBoxes.monthly_invests.containsKey(key)) {
        HiveBoxes.monthly_invests.put(key, 0.0);
      }
    }

    BlocProvider.of<GetProfileBloc>(context).add(GetProfileDetailsEvent());
  }

  List<double> invests = [];
  List<double> capitals = [];
  @override
  int price1 = 0;
  int price = 0;

  List<String> allMonths = [
    "Yan",
    "Fev",
    "Mar",
    "Apr",
    "May",
    "Iyun",
    "Iyul",
    "Aug",
    "Sen",
    "Okt",
    "Noy",
    "Dek",
  ];

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<GetProfileBloc, GetProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetProfileSuccess) {
            invests = HiveBoxes.monthly_invests.values.toList();
            capitals = HiveBoxes.monthly_capitals.values.toList();
            return RefreshIndicator(
              displacement: 25,
              onRefresh: () async {
                BlocProvider.of<GetProfileBloc>(
                  context,
                ).add(GetProfileDetailsEvent());
                await Future.delayed(Duration(seconds: 2));
              },
              child: ListView(
                shrinkWrap: true,

                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  // tepadagi container
                  Container(
                    width: 1.sw,
                    height: 0.37.sh,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.r),
                        bottomRight: Radius.circular(40.r),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: 24.w,
                      right: 24.w,
                      top: 60.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Salom ${state.user.firstName}",
                              style: TextStyle(
                                color: AppColors.white2,
                                fontSize: 18.sp,
                              ),
                            ),
                            Image.asset(
                              'assets/images/app_logo.png',
                              height: 40.h,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Jami sarmoya",
                          style: TextStyle(
                            color: AppColors.white2,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          state.user.totalBalance.toString(),
                          style: TextStyle(
                            color: AppColors.white2,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.18.sw),
                          child: Divider(color: AppColors.white1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  state.user.phpInvestBalance.toString(),
                                  style: TextStyle(
                                    color: AppColors.white1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  "PHP invest",
                                  style: TextStyle(
                                    color: AppColors.white1,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  state.user.phpReitBalance.toString(),
                                  style: TextStyle(
                                    color: AppColors.white1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  "Prime capital",
                                  style: TextStyle(
                                    color: AppColors.white1,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BuildIconButton(
                        dialogWidth: maxWidth * 0.93,
                        dialogHeight: maxHeight * 0.5,
                        cardNumber: "4998930008164513",
                        name: "Ilyosbek Ikromov",
                        widget: CopyCardNumber2Widget(
                          cardNumber: "4998930008164513",
                          name: "Ilyosbek Ikromov",
                        ),
                        icon: "invest.svg",
                        label: "Invest",
                      ),
                      BuildIconButton(
                        dialogWidth: maxWidth * 0.93,
                        dialogHeight: maxHeight * 0.5,
                        widget: CopyCardNumberWidget(
                          iconPath1: "assets/icons/call.svg",
                          iconPath2: "assets/icons/telegram.svg",
                          cardNumber: "+998880090799",
                          name: '@MOHIRA_ADMINSTRATOR',
                        ),
                        phoneNumber: "+998880090799",
                        username: "@MOHIRA_ADMINSTRATOR",
                        icon: "contact.svg",
                        label: "Aloqa",
                        cardNumber: "+998880090799",
                        name: "@MOHIRA_ADMINSTRATOR",
                        iconPath1: "assets/icons/call.svg",
                        iconPath2: "assets/icons/telegram.svg",
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Container(
                      width: 0.83.sw,
                      margin: EdgeInsets.only(top: 40.h),
                      decoration: BoxDecoration(
                        color: AppColors.white2,
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 4,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 15.h,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/rectangular1.png',
                                  color: AppColors.whitePurple,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "PHP invest",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/rectangular2.png',
                                  color: AppColors.whitepink,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Prime Capital",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                          BarChartWidget(
                            startYear: 2025,
                            months: List.generate(
                              invests.length,
                              (index) => allMonths[index % 12],
                            ),
                            phpInvestPrices: invests,
                            primeCapitalPrices: capitals,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIncomeCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const IncomEHistoryPage();
                              },
                            ),
                          );
                        },
                        color: AppColors.primaryColor,

                        title: "Income",
                        price: "5000",
                        iconPath: "assets/images/income.svg",
                      ),
                      _buildIncomeCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ExpenseScreen();
                              },
                            ),
                          );
                        },
                        color: AppColors.red,
                        title: "Expenses",
                        price: "1200",
                        iconPath: "assets/images/expenses.svg",
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is GetProfileLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetProfileError) {
            return Center(child: Text(state.error));
          } else {
            return Text('data yoq');
          }
        },
      ),
    );
  }

  Widget _buildIncomeCard({
    required String title,
    required String price,
    required String iconPath,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 145.w,
        height: 70.h,
        padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white2,
              ),
              child: SvgPicture.asset(iconPath, height: 35.h),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.white1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "\$$price",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
