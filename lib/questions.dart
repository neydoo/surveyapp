import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.all(50),
      padding: EdgeInsets.all(20),
      child: Text(questionText,
      textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          )
          // textAlign: TextAlign.center,
          ),
    );
  }
}
