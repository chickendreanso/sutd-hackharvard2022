import 'package:flutter/material.dart';
import 'package:sutd_hackharvard2022/widgets/barChart.dart';
import '../widgets/appIntegrationCard.dart';
import '../widgets/barChart.dart';
import '../widgets/pieChart.dart';
import 'package:http/http.dart';
import 'dart:convert';

class MyDashboardPage extends StatefulWidget {
  const MyDashboardPage({super.key, required this.title});
  final String title;

  @override
  State<MyDashboardPage> createState() => _MyDashboardPageState();
}

class _MyDashboardPageState extends State<MyDashboardPage> {
  void _httpGet() async {
    var response = await get(Uri.parse(
        "https://kiasuatharvard123.ue.r.appspot.com/filter?person=0"));
    if (response.statusCode != 200) {
      throw Exception("API error");
    }

    Map<String, dynamic> data = jsonDecode(response.body);
    print(data['x']);
    print(data['y']);

    // return jsonDecode(response.body);
  }

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
              margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                children: <Widget>[
                  Text(
                    "I love numbers...",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 200,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: const [
                        Card(
                          margin: EdgeInsets.fromLTRB(20, 5, 10, 5),
                          child: Center(
                            child: Text("9000"),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
                          child: Center(
                            child: Text("3243"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BarChart(),
            PieChart(),
            Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: _httpGet,
                child: const Text(
                  'send get request',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
