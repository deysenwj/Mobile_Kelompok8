import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SalesChartScreen(),
    );
  }
}

class SalesChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grafik'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Back button functionality here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ChartCard(
                title: 'Jumlah Penjualan',
                lineColor: Colors.red,
                dotColor: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ChartCard(
                title: 'Jual (Ribuan)',
                lineColor: Colors.pink,
                dotColor: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartCard extends StatelessWidget {
  final String title;
  final Color lineColor;
  final Color dotColor;

  const ChartCard({
    required this.title,
    required this.lineColor,
    required this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 10,
                  color: lineColor,
                ),
                SizedBox(width: 8),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  minX: 0,
                  maxX: 30,
                  minY: 0,
                  maxY: 5,
                  lineBarsData: [
                    LineChartBarData(
                      spots: _getSpots(),
                      isCurved: false,
                      colors: [lineColor],
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: 4,
                          color: dotColor,
                          strokeWidth: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _getSpots() {
    return [
      FlSpot(0, 2.0),
      FlSpot(5, 4.0),
      FlSpot(10, 3.5),
      FlSpot(15, 4.5),
      FlSpot(20, 3.0),
      FlSpot(25, 5.0),
      FlSpot(30, 4.5),
    ];
  }
}
