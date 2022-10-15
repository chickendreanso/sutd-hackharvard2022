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
        children: [appIntegrationCardWidget(), appIntegrationCardWidget()],
      )),
    );
  }
}
