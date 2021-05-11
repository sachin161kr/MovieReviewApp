import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'details.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.pink,
      accentColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
    ),
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

  sendtonext() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Details(
                text: myController.text,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Review App',
          style: GoogleFonts.itim(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Movie Name',
                  hintStyle: GoogleFonts.itim(),
                ),
                controller: myController,
                style: GoogleFonts.itim(
                  fontSize: 40,
                ),
              )),
          Container(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: GoogleFonts.itim(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Colors.pink,
              ),
              onPressed: () {
                if (myController.text.length != 0) {
                  sendtonext();
                } else {
                  Fluttertoast.showToast(
                    msg: 'Enter the movie name first',
                    toastLength: Toast.LENGTH_LONG,
                  );
                }
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
