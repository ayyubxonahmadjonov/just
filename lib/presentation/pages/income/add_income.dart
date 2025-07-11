import 'package:real_project/data/models/category_model.dart'
    show CategoryModel;
import 'package:real_project/presentation/view_models/bloc/get_categories/get_categories_bloc.dart';

import '../../../core/constants/app_imports.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  String? selectedCategory;
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  TextEditingController amountController = TextEditingController();
  List<CategoryModel> categories = [];
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetCategoriesBloc>(context).add(GetCategoriesListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 30.h),

              /// Kategoriya va summa
              Row(
                children: [
                  BlocConsumer<GetCategoriesBloc, GetCategoriesState>(
                    listener: (context, state) {
                      if (state is GetCategoriesSuccess) {
                        categories = state.categories;
                      }
                    },
                    builder: (context, state) {
                      return Flexible(
                        flex: 7,
                        child:
                            state is GetCategoriesSuccess
                                ? DropdownButtonFormField<String>(
                                  value: selectedCategory,

                                  decoration: const InputDecoration(
                                    hintText: 'Kategoriyani tanlang',
                                    border: UnderlineInputBorder(),
                                  ),
                                  items:
                                      [
                                        state
                                            .categories
                                            .first
                                            .categoryTypeDisplay
                                            .toString(),
                                      ].map((category) {
                                        return DropdownMenuItem(
                                          value: category,
                                          child: Text(category),
                                        );
                                      }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCategory = value;
                                    });
                                  },
                                )
                                : const SizedBox(),
                      );
                    },
                  ),
                  SizedBox(width: 30.w),
                  Flexible(
                    flex: 4,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: amountController,
                      decoration: const InputDecoration(
                        hintText: '0 \$',

                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              /// Sana tanlash
              Row(
                children: [
                  SizedBox(
                    width: 70.w,
                    height: 40.h,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedDay,
                      hint: const Text("Kun"),
                      items:
                          List.generate(31, (index) => "${index + 1}")
                              .map(
                                (day) => DropdownMenuItem(
                                  value: day,
                                  child: Text(day),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDay = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 30.w),
                  SizedBox(
                    width: 70.w,
                    height: 40.h,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedMonth,
                      hint: const Text("Oy"),
                      items:
                          [
                                'Yan',
                                'Fev',
                                'Mar',
                                'Apr',
                                'May',
                                'Iyun',
                                'Iyul',
                                'Avg',
                                'Sen',
                                'Okt',
                                'Noy',
                                'Dek',
                              ]
                              .map(
                                (month) => DropdownMenuItem(
                                  value: month,
                                  child: Text(month),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 30.w),

                  SizedBox(
                    width: 70.w,
                    height: 40.h,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedYear,
                      hint: const Text("Yil"),
                      items:
                          List.generate(
                            4,
                            (index) => "${DateTime.now().year - index}",
                          ).map((year) {
                            return DropdownMenuItem(
                              value: year,
                              child: Text(year),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50.h),

              CustomButton(
                onPressed: () {
                  final formattedDate =
                      selectedDay != null &&
                              selectedMonth != null &&
                              selectedYear != null
                          ? '${selectedYear!}-${GetMonthNumber().getMonthNumber(selectedMonth!)}-${selectedDay!.padLeft(2, '0')}'
                          : '';

                  BlocProvider.of<CreateIncomeBloc>(context).add(
                    CreateNewIncomeEvent(
                      amount: amountController.text,
                      date: formattedDate,
                      category: categories.first.id,
                    ),
                  );

                  Navigator.pop(context);
                },

                title: "Qo'shish",
                bacColor: AppColors.primaryColor,
                textColor: AppColors.white2,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                borderRadius: 20.r,
                width: 180.w,
                height: 36.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
