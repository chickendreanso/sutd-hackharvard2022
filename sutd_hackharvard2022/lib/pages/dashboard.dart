import 'package:flutter/material.dart';
import 'package:sutd_hackharvard2022/widgets/barChart.dart';
import '../widgets/appIntegrationCard.dart';
import '../widgets/barChart.dart';

class MyDashboardPage extends StatefulWidget {
  const MyDashboardPage({super.key, required this.title});
  final String title;

  @override
  State<MyDashboardPage> createState() => _MyDashboardPageState();
}

class _MyDashboardPageState extends State<MyDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const Card(
              child: Center(
                child: Text("Summary #1"),
              ),
            ),
            const Card(
              child: Center(
                child: Text("Summary #2"),
              ),
            ),
            Card(
              child: Center(
                child: BarChart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
