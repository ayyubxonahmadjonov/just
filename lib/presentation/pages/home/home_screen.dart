import 'package:real_project/data/datasources/local/hive_helper/hive_names.dart';
import 'package:real_project/presentation/widgets/custom_diagra.dart';
import 'package:real_project/presentation/widgets/line_chart.dart';

import '../../../core/constants/app_imports.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    for (int i = 1; i <= 4; i++) {
      final key = "2025-${i.toString().padLeft(2, '0')}";

      if (!HiveBoxes.monthly_capitals.containsKey(key)) {
        HiveBoxes.monthly_capitals.put(key, 0.0);
      }
      if (!HiveBoxes.monthly_invests.containsKey(key)) {
        HiveBoxes.monthly_invests.put(key, 0.0);
      }
    }

    // Boshqa ishlar
    BlocProvider.of<GetProfileBloc>(context).add(GetProfileDetailsEvent());
  }

  List<double> invests = [];
  List<double> capitals = [];

  @override
  int price1 = 0;
  int price = 0;
  String formattedDate =
      "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}";

  List<String> allMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Iyun",
    "Iyul",
    "Aug",
    "Sen",
    "Oct",
    "Noy",
    "Dec",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<GetProfileBloc, GetProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetProfileSuccess) {
            double invest = double.parse(
              state.user.phpInvestBalance.toString(),
            );
            double capital = double.parse(state.user.phpReitBalance.toString());

            HiveBoxes.monthly_invests.put(formattedDate, invest);
            HiveBoxes.monthly_capitals.put(formattedDate, capital);

            invests = HiveBoxes.monthly_invests.values.toList();
            capitals = HiveBoxes.monthly_capitals.values.toList();

            return Column(
              children: [
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
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 60.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Salom ${state.user.firstName}",
                            style: TextStyle(
                              color: Colors.white,
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
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      Text(
                        state.user.totalBalance.toString(),
                        style: TextStyle(
                          color: Colors.white,
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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BuildIconButton(icon: "invest.png", label: "Invest"),

                        BuildIconButton(icon: "contact.png", label: "Aloqa"),
                      ],
                    ),

                    Container(
                      width: 0.85.sw,

                      margin: EdgeInsets.only(top: 40.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                                Image.asset('assets/images/rectangular1.png'),
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
                                Image.asset('assets/images/rectangular2.png'),
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
                  ],
                ),
              ],
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
}
