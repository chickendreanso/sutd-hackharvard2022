import 'package:flutter/material.dart';
import '../pages/dashboard.dart';

class appIntegrationCardWidget extends StatelessWidget {
  const appIntegrationCardWidget(
      {Key? key, required this.imagePath, required this.appName})
      : super(key: key);

  final String imagePath;
  final String appName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const MyDashboardPage(title: "Dashboard")))
      },
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(imagePath, height: 160),
              Text(appName),
            ],
          ),
        ),
      ),
    );
  }
}
