import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/screen3.dart';

// import '../questions.dart';

class Screen2 extends StatefulWidget {
  final Map screen1Answer;

  const Screen2({Key key, this.screen1Answer}) : super(key: key);
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool answerSelected = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
                child: Column(
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
                            child: Container(
                              width: double.infinity,
                              // margin: EdgeInsets.all(50),
                              padding: EdgeInsets.all(20),
                              child: Text(
                                  'How did you feel about the length of the play?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  )
                                  // textAlign: TextAlign.center,
                                  ),
                            ))),
                    Container(
                        width: double.infinity,
                        // margin: EdgeInsets.all(50),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // answer = "1";
                                  answerSelected = true;
                                });
                                widget.screen1Answer['screen2'] = "zero";
                              },
                              child: Container(
                                height: 45,
                                margin: EdgeInsets.all(5),
                                width:
                                    MediaQuery.of(context).size.width * 0.120,
                                decoration: BoxDecoration(
                                    // color: VerifiColors.blue,
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/img/png/zero.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1),
                                        blurRadius: 19.5,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // answer = "1";
                                  answerSelected = true;
                                });
                                widget.screen1Answer['screen2'] = "one";
                              },
                              child: Container(
                                height: 45,
                                margin: EdgeInsets.all(5),
                                width:
                                    MediaQuery.of(context).size.width * 0.120,
                                decoration: BoxDecoration(
                                    // color: VerifiColors.blue,
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/img/png/one.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1),
                                        blurRadius: 19.5,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // answer = "1";
                                  answerSelected = true;
                                });
                                widget.screen1Answer['screen2'] = "two";
                              },
                              child: Container(
                                height: 45,
                                margin: EdgeInsets.all(5),
                                width:
                                    MediaQuery.of(context).size.width * 0.120,
                                decoration: BoxDecoration(
                                    // color: VerifiColors.blue,
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/img/png/two.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1),
                                        blurRadius: 19.5,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // answer = "1";
                                  answerSelected = true;
                                });
                                widget.screen1Answer['screen2'] = "three";
                              },
                              child: Container(
                                height: 45,
                                margin: EdgeInsets.all(5),
                                width:
                                    MediaQuery.of(context).size.width * 0.120,
                                decoration: BoxDecoration(
                                    // color: VerifiColors.blue,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/img/png/three.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1),
                                        blurRadius: 19.5,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // answer = "1";
                                  answerSelected = true;
                                });
                                widget.screen1Answer['screen2'] = "four";
                              },
                              child: Container(
                                height: 45,
                                margin: EdgeInsets.all(5),
                                width:
                                    MediaQuery.of(context).size.width * 0.120,
                                decoration: BoxDecoration(
                                    // color: VerifiColors.blue,
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/img/png/four.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1),
                                        blurRadius: 19.5,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print(answerSelected);
                                setState(() {
                                  // answer = "1";
                                  answerSelected = true;
                                });
                                widget.screen1Answer['screen2'] = "five";
                              },
                              child: Container(
                                height: 45,
                                margin: EdgeInsets.all(5),
                                width:
                                    MediaQuery.of(context).size.width * 0.120,
                                decoration: BoxDecoration(
                                    // color: VerifiColors.blue,
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/img/png/five.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1),
                                        blurRadius: 19.5,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                            )
                            // ])
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.all(50),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: ButtonWidget(
                              danger: true,
                              text: 'Back',
                              onTap: () => Navigator.pop(context),
                            ),
                          ),
                          answerSelected
                              ? Container(
                                  margin: EdgeInsets.all(5),
                                  child: ButtonWidget(
                                    text: 'Next',
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Screen3(
                                          screen2Answer: widget.screen1Answer,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
