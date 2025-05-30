import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/constants/app_imports.dart';

class BarChartWidget extends StatefulWidget {
  final List<String> months;
  final List<double> phpInvestPrices;
  final List<double> primeCapitalPrices;
  final int startYear;

  const BarChartWidget({
    Key? key,
    required this.months,
    required this.phpInvestPrices,
    required this.primeCapitalPrices,
    this.startYear = 2025,
  }) : super(key: key);

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final ScrollController _scrollController = ScrollController();

  double adjustedValue(double val) => val == 0 ? 0.5 : val;

  String calculatePercentageChange(double current, double previous) {
    if (previous == 0) return 'N/A';
    double change = ((current - previous) / previous) * 100;
    return change >= 0
        ? '+${change.toStringAsFixed(1)}%'
        : '${change.toStringAsFixed(1)}%';
  }

  @override
  void initState() {
    super.initState();
    // Scroll to the current month after the frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentMonth();
    });
  }

  void _scrollToCurrentMonth() {
    // Get current month and year
    final now = DateTime.now();
    final currentMonth = now.month; // 1 to 12
    final currentYear = now.year;

    // Calculate the index of the current month in the months list
    int currentMonthIndex = -1;
    for (int i = 0; i < widget.months.length; i++) {
      int year = widget.startYear + (i ~/ 12);
      int monthIndex = i % 12;
      String monthName = widget.months[i];

      List<String> monthNames = [
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
      if (monthNames[monthIndex] == monthName && year == currentYear) {
        if (monthIndex + 1 == currentMonth) {
          currentMonthIndex = i;
          break;
        }
      }
    }

    if (currentMonthIndex != -1) {
      double offset = currentMonthIndex * 100.w;
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxPrice = 0;
    for (var price in widget.phpInvestPrices + widget.primeCapitalPrices) {
      if (price > maxPrice) maxPrice = price;
    }
    maxPrice = maxPrice == 0 ? 10 : maxPrice * 1.2;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Container(
        width: widget.months.length * 100.w,
        height: 250.h,
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            maxY: maxPrice,
            minY: 0,
            alignment: BarChartAlignment.spaceAround,
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  String label = rodIndex == 0 ? 'PHP Invest' : 'Prime Capital';
                  double currentPrice = rod.toY;

                  double? previousPrice =
                      groupIndex > 0
                          ? (rodIndex == 0
                              ? widget.phpInvestPrices[groupIndex - 1]
                              : widget.primeCapitalPrices[groupIndex - 1])
                          : null;

                  String? percentage =
                      previousPrice != null
                          ? calculatePercentageChange(
                            currentPrice,
                            previousPrice,
                          )
                          : null;

                  String tooltipText =
                      '$label\n${currentPrice.toStringAsFixed(2)} \$';

                  if (percentage != null && percentage != 'N/A') {
                    tooltipText += '\n$percentage';
                  }

                  Color textColor = Colors.white;
                  if (percentage != null && percentage != 'N/A') {
                    textColor =
                        percentage.startsWith('+') ? Colors.green : Colors.red;
                  }

                  return BarTooltipItem(
                    tooltipText,
                    TextStyle(color: textColor, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index >= 0 && index < widget.months.length) {
                      return Text(
                        widget.months[index],
                        style: const TextStyle(fontSize: 12),
                      );
                    }
                    return const Text('');
                  },
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index % 12 == 0) {
                      int year = widget.startYear + (index ~/ 12);
                      return Text(
                        year.toString(), // Fixed: Changed Pascals.toString to year.toString
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return const Text('');
                  },
                ),
              ),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: AppColors.white1),
            ),
            barGroups: List.generate(
              widget.months.length,
              (index) => BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: adjustedValue(widget.phpInvestPrices[index]),
                    color: AppColors.whitePurple,
                    width: 10,
                  ),
                  BarChartRodData(
                    toY: adjustedValue(widget.primeCapitalPrices[index]),
                    color: AppColors.whitepink,
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
