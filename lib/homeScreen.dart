import 'package:flutter/material.dart';
import 'package:surveyapp/models/screen1.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Survey App'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Take Survey'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => Screen1()),
            ),
          ),
        ),
      ),
    );
  }
}
