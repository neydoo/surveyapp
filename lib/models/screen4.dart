import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/screen5.dart';

// import '../questions.dart';

class Screen4 extends StatefulWidget {
  final Map screen3Answer;

  const Screen4({Key key, this.screen3Answer}) : super(key: key);

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  bool answerSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    child: Column(
                      children: <Widget>[
                        Column(children: [
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
                                    'Would you have been willing to pay N100 for the show? ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    )
                                    // textAlign: TextAlign.center,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              // margin: EdgeInsets.all(50),
                              padding: EdgeInsets.all(20),
                              child: Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        answerSelected = true;
                                      });
                                      widget.screen3Answer['screen4'] = 'one';
                                    },
                                    child: Container(
                                      height: 50,
                                      margin: EdgeInsets.all(25),
                                      width: MediaQuery.of(context).size.width *
                                          0.145,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/one.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        answerSelected = true;
                                      });
                                      widget.screen3Answer['screen4'] = 'two';
                                    },
                                    child: Container(
                                      height: 52,
                                      margin: EdgeInsets.all(25),
                                      width: MediaQuery.of(context).size.width *
                                          0.145,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/two.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        answerSelected = true;
                                      });
                                      widget.screen3Answer['screen4'] = 'three';
                                    },
                                    child: Container(
                                      height: 52,
                                      margin: EdgeInsets.all(25),
                                      width: MediaQuery.of(context).size.width *
                                          0.145,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/three.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
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
                                                  builder:
                                                      (BuildContext context) =>
                                                          Screen5(
                                                            screen4Answer: widget
                                                                .screen3Answer,
                                                          ))),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
