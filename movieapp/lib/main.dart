import 'package:flutter/material.dart';

import 'details.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: myController,
                style: TextStyle(
                  fontSize: 40,
                ),
              )),
          Container(
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(
                            text: myController.text,
                          )),
                );
              },
              child: Text(
                'Get Movie Details',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
