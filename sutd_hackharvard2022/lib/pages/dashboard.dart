import 'package:flutter/material.dart';
import 'package:sutd_hackharvard2022/pages/friends.dart';
import 'package:sutd_hackharvard2022/widgets/hourMostActive.dart';
import 'package:sutd_hackharvard2022/widgets/messagesPerDay.dart';
import '../widgets/appIntegrationCard.dart';
import '../widgets/bestChat.dart';
import '../widgets/messagesPerDay.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:motor_flutter/motor_flutter.dart';

import '../widgets/topFriends.dart';

class MyDashboardPage extends StatefulWidget {
  const MyDashboardPage({super.key, required this.title});
  final String title;

  @override
  State<MyDashboardPage> createState() => _MyDashboardPageState();
}

class _MyDashboardPageState extends State<MyDashboardPage> {
  void _httpGet() async {
    var response = await get(
        Uri.parse("https://chope-sutd-harvard-hack.ue.r.appspot.com/topTen"));
    if (response.statusCode != 200) {
      throw Exception("API error");
    }

    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);

    // return jsonDecode(response.body);
  }

  void _fetchDoc() async {
    final resp = await MotorFlutter.to
        .findBucket(creator: "snr1fyx9u7seuhmwnf9f875en9u9gxpt8pyg9dzm9h");
    print(resp);
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
            GestureDetector(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFriendsPage()))
              },
              child: TopFriends(),
            ),
            ChatCount(),
            BestChat(),
            HourMostActive(),
          ],
        ),
      ),
    );
  }
}
