import 'package:flutter/material.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyAdminPage extends StatefulWidget {
  @override
  State<MyAdminPage> createState() => _MyAdminPageState();
}

class _MyAdminPageState extends State<MyAdminPage> {
  TextEditingController didController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  String _address = "";
  var _schema;

  void _createSchema() async {
    var response = await MotorFlutter.to.publishSchema("top_friends", {
      'name': SchemaFieldKind(kind: Kind.STRING),
      'freq': SchemaFieldKind(kind: Kind.INT)
    });
    print(response);
  }

  void _fetchSchema() async {
    var schemas = await MotorFlutter.to
        .getSchema("did:snr:a3d977a4-7bdd-455f-a6f2-32cf16b5a00c");
    setState(() {
      _schema = schemas;
    });
    print(schemas);
    // for (int i = 0; i < schemas.length; i++) {
    //   print(schemas[i].get("top_friends"));
    // }
    // setState(() {
    //   _schema = schemas;
    // });
    // print(_schema);
    // print(schemas);
  }

  void _printSchema() {
    print(_schema);
  }

  void _uploadDocument() async {
    var mydoc = _schema!.newDocument("top_friends");
    mydoc.set<String>("name", "John");
    mydoc.set<int>("freq", 5);
    var response = await mydoc.upload();

    _address = response!.cid;
    print(_address);
  }

  void _createBucket() async {
    var response = await MotorFlutter.to.createBucket("top_friends");
    print(response.did);
    print(response.whereIs);
  }

  void _fetchBucket() async {
    var response = await MotorFlutter.to.findBucket(
        did: "did:snr:f730e4d71beb4953a0ececcac03c508d",
        creator: "snr1j7xepqalh40pdf9gzy7pfm0rsdk8jppwuuhjru");
    print(response);
    print(response.length);
    for (int i = 0; i < response.length; i++) {
      print(response[i].get("top_friends"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: didController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'did',
                    hintText: 'Enter your secure did'),
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
                onPressed: _createSchema,
                child: const Text(
                  'Test Create Schema',
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
                onPressed: _fetchSchema,
                child: const Text(
                  'Fetch Schema',
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
                onPressed: _uploadDocument,
                child: const Text(
                  'Upload Document',
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
                onPressed: _createBucket,
                child: const Text(
                  'create bucket',
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
                onPressed: _fetchBucket,
                child: const Text(
                  'fetch bucket',
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
                onPressed: _printSchema,
                child: const Text(
                  'print current schema',
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
