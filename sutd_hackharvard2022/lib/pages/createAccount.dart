import 'package:flutter/material.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyCreateAccountPage extends StatefulWidget {
  final Function setLogin;
  final String title;

  const MyCreateAccountPage(
      {super.key, required this.title, required this.setLogin});

  @override
  State<MyCreateAccountPage> createState() => _MyCreateAccountPageState();
}

class _MyCreateAccountPageState extends State<MyCreateAccountPage> {
  TextEditingController passwordController = TextEditingController();

  void _createAccount() async {
    // Create a new account with the username and password
    EasyLoading.show(status: 'loading...');
    AuthInfo response =
        await MotorFlutter.to.createAccount(passwordController.text);
    widget.setLogin(response.address, response.aesDscKey, response.aesPskKey);
    print(response);
    EasyLoading.dismiss();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure password'),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: _createAccount,
                child: const Text(
                  'Create Account',
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
