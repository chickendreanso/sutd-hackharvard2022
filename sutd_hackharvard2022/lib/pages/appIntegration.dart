import 'package:flutter/material.dart';
import '../widgets/appIntegrationCard.dart';

class MyAppIntegration extends StatefulWidget {
  const MyAppIntegration({super.key, required this.title});
  final String title;

  @override
  State<MyAppIntegration> createState() => _MyAppIntegrationState();
}

class _MyAppIntegrationState extends State<MyAppIntegration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: const [
            appIntegrationCardWidget(
                imagePath: "assets/images/beam.jpeg", appName: 'Beam'),
            appIntegrationCardWidget(
                imagePath: "assets/images/dtube.png", appName: 'D.Tube'),
            appIntegrationCardWidget(
                imagePath: "assets/images/mirror.jpeg", appName: 'mirror.xyz'),
            appIntegrationCardWidget(
                imagePath: "assets/images/audius.jpeg", appName: 'Audius'),
            appIntegrationCardWidget(
                imagePath: "assets/images/comingsoon.png",
                appName: 'Coming soon!'),
          ],
        ),
      ),
    );
  }
}
