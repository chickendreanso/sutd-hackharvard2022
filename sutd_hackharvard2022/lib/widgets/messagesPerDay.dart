import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final int y;
}

Future<List<ChartData>> _httpGet() async {
  final response = await get(
      Uri.parse("https://chope-sutd-harvard-hack.ue.r.appspot.com/chatCount"));
  if (response.statusCode != 200) {
    print("error");
    throw Exception("API error");
  }

  Map<String, dynamic> data = jsonDecode(response.body);
  // loop through data and assign chartData
  List<ChartData> chartData = [];
  // data is a dictionary. loop through each key of the dictionary, and add the key and value to data
  data.forEach((key, value) {
    chartData.add(ChartData(key, value));
  });

  return chartData;
}

class ChatCount extends StatelessWidget {
  late Future<List<ChartData>> chartData;

  @override
  Widget build(BuildContext context) {
    return Card(
      // add left right margin of 40 and top bottom margin of 10
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      // child with future builder
      child: FutureBuilder<List<ChartData>>(
        future: _httpGet(),
        builder: (context, AsyncSnapshot<List<ChartData>> snapshot) {
          if (snapshot.hasData) {
            return SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Chat Count'),
              legend: Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<ChartData, String>>[
                ColumnSeries<ChartData, String>(
                    dataSource: snapshot.data!,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    dataLabelSettings: DataLabelSettings(isVisible: false))
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
