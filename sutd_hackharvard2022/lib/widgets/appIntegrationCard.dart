import 'package:flutter/material.dart';
import '../pages/dashboard.dart';

class appIntegrationCardWidget extends StatelessWidget {
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
              Image.asset('assets/images/jeff.png', height: 160),
              Text("test123")
            ],
          ),
        ),
      ),
    );
  }
}
