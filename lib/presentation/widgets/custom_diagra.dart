import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomDiagram extends StatelessWidget {
  final String price1; // Birinchi narx (String sifatida keladi)
  final String price2; // Ikkinchi narx (String sifatida keladi)

  const CustomDiagram({super.key, required this.price1, required this.price2});

  @override
  Widget build(BuildContext context) {
    // String narxlarni double ga aylantirish
    final double parsedPrice1 =
        double.tryParse(price1) ?? 0.0; // Agar parse qilib bo‘lmasa, 0.0
    final double parsedPrice2 =
        double.tryParse(price2) ?? 0.0; // Agar parse qilib bo‘lmasa, 0.0

    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            // Birinchi narx grafikasi
            LineChartBarData(
              spots: _generateSpots(parsedPrice1),
              isCurved: true,
              color: Colors.blue.withOpacity(0.3),
              barWidth: 0,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.withOpacity(0.3),
              ),
              dotData: const FlDotData(show: false),
            ),
            // Ikkinchi narx grafikasi
            LineChartBarData(
              spots: _generateSpots(parsedPrice2),
              isCurved: true,
              color: Colors.purple.withOpacity(0.5),
              barWidth: 0,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.purple.withOpacity(0.5),
              ),
              dotData: const FlDotData(show: false),
            ),
          ],
          minY: 0,
          maxY: 100,
        ),
      ),
    );
  }

  // Narx asosida to‘lqinli nuqtalar generatsiya qilish
  List<FlSpot> _generateSpots(double price) {
    List<FlSpot> spots = [];
    for (int i = 0; i < 10; i++) {
      double wave =
          price + (10 * (i % 2 == 0 ? 1 : -1)); // To‘lqin effektini yaratish
      spots.add(FlSpot(i.toDouble(), wave));
    }
    return spots;
  }
}
