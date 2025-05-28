import 'package:fl_chart/fl_chart.dart';
import 'package:real_project/core/constants/app_imports.dart';

class BarChartWidget extends StatelessWidget {
  final List<String> months;
  final List<double> phpInvestPrices;
  final List<double> primeCapitalPrices;
  final int startYear; // Boshlanish yili qo‘shildi

  const BarChartWidget({
    Key? key,
    required this.months,
    required this.phpInvestPrices,
    required this.primeCapitalPrices,
    this.startYear = 2025,
  }) : super(key: key);

  double adjustedValue(double val) => val == 0 ? 0.5 : val;

  String calculatePercentageChange(double current, double previous) {
    if (previous == 0) return 'N/A';
    double change = ((current - previous) / previous) * 100;
    return change >= 0
        ? '+${change.toStringAsFixed(1)}%'
        : '${change.toStringAsFixed(1)}%';
  }

  @override
  Widget build(BuildContext context) {
    double maxPrice = 0;
    for (var price in phpInvestPrices + primeCapitalPrices) {
      if (price > maxPrice) maxPrice = price;
    }
    maxPrice = maxPrice == 0 ? 10 : maxPrice * 1.2;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: months.length * 100.w,
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
                  double previousPrice =
                      groupIndex > 0
                          ? (rodIndex == 0
                              ? phpInvestPrices[groupIndex - 1]
                              : primeCapitalPrices[groupIndex - 1])
                          : 0;
                  String percentage =
                      groupIndex > 0
                          ? calculatePercentageChange(
                            currentPrice,
                            previousPrice,
                          )
                          : 'N/A';
                  Color textColor =
                      percentage.startsWith('+') ? Colors.green : Colors.red;
                  if (percentage == 'N/A') textColor = Colors.white;
                  return BarTooltipItem(
                    '$label\n${currentPrice.toStringAsFixed(2)} \$\n$percentage',
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
                    if (index >= 0 && index < months.length) {
                      return Text(
                        months[index],
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
                      int year = startYear + (index ~/ 12);
                      return Text(
                        year.toString(),
                        style: const TextStyle(
                          color: Colors.black,
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
              months.length,
              (index) => BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: adjustedValue(phpInvestPrices[index]),
                    color: AppColors.whitePurple,
                    width: 10,
                  ),
                  BarChartRodData(
                    toY: adjustedValue(primeCapitalPrices[index]),
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
