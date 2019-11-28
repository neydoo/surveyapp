import 'package:flutter/material.dart';

import './questions.dart';
import './models/screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var answers = [];

  void _answerQuestion() {
    setState(() {
      // ToDo
      // it shouldn't go above array length
      _questionIndex += 1;
      if (_questionIndex > 4) {
        _questionIndex = 4;
      }
    });
    // answers.add();
  }

  void _previousQuestion() {
    setState(() {
      // ToDo
      // it shouldn't go lesser than 0
      _questionIndex = _questionIndex - 1;
      if (_questionIndex < 1) {
        _questionIndex = 1;
      }
    });
    // answers.add();
  }

  Widget build(BuildContext ctx) {
    var questions = [
      'How did the performance make you feel?',
      'How did you feel about the length of the play?',
      'Would you recommend the show to another person?',
      'Would you have be willing to pay N100 for the show?',
      'Do you feel more accepting of vaccines now?'
    ];

    return MaterialApp(
        home: Scaffold(
            body: Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  height: 240,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(136, 14, 79, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Question(questions[_questionIndex]),
                  )),
              Answer1(),
              Container(
                  margin: EdgeInsets.all(50),
                  child: Row(children: [
                    Container(
                        margin: EdgeInsets.all(5),
                        child: RaisedButton(
                          color: Colors.redAccent,
                          child: Text('previous question'),
                          onPressed: _previousQuestion,
                        )),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: RaisedButton(
                          color: Colors.greenAccent,
                          child: Text('next question'),
                          onPressed: _answerQuestion,
                        ))
                  ]))
            ],
          ),
        ],
      ),
    )));
  }
}
