import 'package:flutter/material.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'createAccount.dart';
import 'appIntegration.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});
  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _address = "";
  List<int>? _dscKey;
  List<int>? _pskKey;

  void _setLoginInfo(String address, List<int> dsckey, List<int> psckey) {
    setState(() {
      _address = address;
      _dscKey = dsckey;
      _pskKey = psckey;
    });
  }

  void _createAccountPage() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyCreateAccountPage(
                title: "Create Account", setLogin: _setLoginInfo)));
  }

  void _login() async {
    EasyLoading.show(status: 'loading...');
    var resp = await MotorFlutter.to.login(
        password: passwordController.text,
        address: _address,
        dscKey: _dscKey,
        pskKey: _pskKey);
    var resp2 = await MotorFlutter.to.connect();
    EasyLoading.dismiss();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const MyAppIntegration(title: "App Integration")));
  }

  void _createSchema() async {
    EasyLoading.show(status: 'loading...');
    final res = await MotorFlutter.to.publishSchema("Test", {
      'name': SchemaFieldKind(kind: Kind.STRING),
      'age': SchemaFieldKind(kind: Kind.INT)
    });
    if (res == null) {
      throw Exception('Schema creation failed');
    }
    print('Schema created successfully: ${res}');
    EasyLoading.dismiss();
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText:
                        'Enter valid Address as snr1ioiaksldjfenkjaof29oi...'),
              ),
            ),
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
              width: 250,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: _login,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
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
                onPressed: _createAccountPage,
                child: const Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Text(_address),
            Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: _createSchema,
                child: const Text(
                  'Test Create Schema',
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
