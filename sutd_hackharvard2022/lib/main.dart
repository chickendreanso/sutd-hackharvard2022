import 'package:flutter/material.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'pages/login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// Modify the main method to be Future<void>
Future<void> main() async {
  // Init method sets up State Management with GetX and ensures that Widgets are
  // rendered before the Motor Node is ready.
  await MotorFlutter.init();

  // Start your App like normal
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyLoginPage(title: 'Login Page'),
      builder: EasyLoading.init(),
    );
  }
}
