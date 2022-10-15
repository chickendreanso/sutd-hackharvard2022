import 'package:flutter/material.dart';
import '../widgets/appIntegrationCard.dart';

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
            Card(
              child: Center(
                child: Text("Summary #1"),
              ),
            ),
            Card(
              child: Center(
                child: Text("Summary #2"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
