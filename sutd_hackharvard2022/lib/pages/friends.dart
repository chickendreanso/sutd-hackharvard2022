import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sutd_hackharvard2022/pages/summary.dart';

class MyFriendsPage extends StatefulWidget {
  @override
  State<MyFriendsPage> createState() => _MyFriendsPageState();
}

Future<List<dynamic>> _getSummary(int friend) async {
  final response = await get(Uri.parse(
      "https://chope-sutd-harvard-hack.ue.r.appspot.com/bestChat?person=${friend}"));
  if (response.statusCode != 200) {
    print("error");
    throw Exception("API error");
  }
  Map<String, dynamic> data =
      new Map<String, dynamic>.from(json.decode(response.body));
  return data["best_chat"]!["dialogue"]!;
}

class _MyFriendsPageState extends State<MyFriendsPage> {
  List<String> friends = [
    "Noah Kong",
    "Zenton Yam",
    "Ernest",
    "Zhi Xiang",
    "Joseph Low",
    "Ke Hong",
    "Clarence Lee",
    "Christopher",
    "Phei Rong",
    "Nico"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Choose a friend to better understand your relationship"),
            // create 10 buttons numbered 1 to 10
            for (int i = 0; i < 10; i++)
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: ElevatedButton(
                  onPressed: () {
                    EasyLoading.show(status: 'loading...');
                    List<dynamic> summary = [];
                    // get summary of best chat as a future and render as text
                    _getSummary(i).then((value) {
                      summary = value;
                      print("summary");
                      print(summary);
                      // navigate to summary page and pass in summary
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SummaryPage(
                                summary: summary, friend: friends[i])),
                      );

                      print("after summary");
                    });
                    EasyLoading.dismiss();
                  },
                  child: Text(friends[i]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
