import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:payment/fictive/data.dart';

class StepChart extends StatelessWidget {
  final List<Transaction> transactions;

  StepChart({required this.transactions});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = [];
    final List<String> labels = ['01', '07', '14', '21', '28'];
    double minBalance = double.infinity;
    double maxBalance = -double.infinity;

    double currentBalance = 0;
    double total = 0;
    DateTime date;
  double maxSteps = MediaQuery.of(context).size.width / labels.length;
int stepInterval = (transactions.length / maxSteps).round();


    for (int i = 0; i < transactions.length; i += stepInterval) {
      final transaction = transactions[i];
      currentBalance += transaction.amount;

      date = DateTime.parse(transaction.date);

      if (currentBalance < minBalance) {
        minBalance = currentBalance;
      }
      if (currentBalance > maxBalance) {
        maxBalance = currentBalance;
      }

      spots.add(FlSpot(i.toDouble(), currentBalance));
      total = currentBalance;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total dépenses',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                total.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              int index = value.toInt();
                              if (index >= 0 && index < labels.length) {
                                return Text(labels[index]);
                              }
                              return Text('');
                            }),
                      ),
                      leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false))),
                  borderData: FlBorderData(
                    show: false,
                    border: Border.all(color: Colors.blueAccent, width: 1),
                  ),
                  minY: minBalance,
                  maxY: maxBalance,
                  minX: 0,
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: false,
                      color: const Color(0xff4af699),
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color:
                            Color.fromARGB(255, 48, 133, 218).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
