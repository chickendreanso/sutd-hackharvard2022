import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class PieChart extends StatelessWidget {
  List<_PieData> data = [
    _PieData("David", 25),
    _PieData("John", 42),
    _PieData("Steve", 22),
    _PieData("Others", 34),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      // add left right margin of 40 and top bottom margin of 10
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: SfCircularChart(
        title: ChartTitle(text: 'Sales by employee'),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CircularSeries<_PieData, String>>[
          PieSeries<_PieData, String>(
              dataSource: data,
              xValueMapper: (_PieData data, _) => data.name,
              yValueMapper: (_PieData data, _) => data.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }
}

class _PieData {
  _PieData(this.name, this.sales);

  final String name;
  final double sales;
}
