import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/screen4.dart';

// import '../questions.dart';

class Screen3 extends StatefulWidget {
  final Map screen2Answer;

  const Screen3({Key key, this.screen2Answer}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool answerSelected = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Container(
            child: Column(
              children: <Widget>[
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
                  padding: EdgeInsets.only(left:50,top: 20),
                  child: Column(
                    children: [
                      Row(children: <Widget>[
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       // answer = "1";
                        //       answerSelected = true;
                        //     });
                        //     widget.screen2Answer['screen3'] = "zero";
                        //   },
                        //   child: Container(
                        //     height: 45,
                        //     margin: EdgeInsets.all(5),
                        //     width: MediaQuery.of(context).size.width *
                        //         0.120,
                        //     decoration: BoxDecoration(
                        //         // color: VerifiColors.blue,
                        //         image: DecorationImage(
                        //           image: AssetImage(
                        //               "assets/img/png/zero.png"),
                        //           fit: BoxFit.cover,
                        //         ),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color:
                        //                 Color.fromRGBO(0, 0, 0, 0.1),
                        //             blurRadius: 19.5,
                        //             offset: Offset(0, 6),
                        //           )
                        //         ],
                        //         borderRadius: BorderRadius.all(
                        //             Radius.circular(5))),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // answer = "1";
                              answerSelected = true;
                            });
                            widget.screen2Answer['screen3'] = "one";
                          },
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width * 0.120,
                            decoration: BoxDecoration(
                                // color: VerifiColors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/png/one.png"),
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
                            widget.screen2Answer['screen3'] = "two";
                          },
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width * 0.120,
                            decoration: BoxDecoration(
                                // color: VerifiColors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/png/two.png"),
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
                            widget.screen2Answer['screen3'] = "three";
                          },
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width * 0.120,
                            decoration: BoxDecoration(
                                // color: VerifiColors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/png/three.png"),
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
                            widget.screen2Answer['screen3'] = "four";
                          },
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width * 0.120,
                            decoration: BoxDecoration(
                                // color: VerifiColors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/png/four.png"),
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
                            widget.screen2Answer['screen3'] = "five";
                          },
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width * 0.120,
                            decoration: BoxDecoration(
                                // color: VerifiColors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/png/five.png"),
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
                      ]),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(answerSelected);
                              setState(() {
                                // answer = "1";
                                answerSelected = true;
                              });
                              widget.screen2Answer['screen3'] = "six";
                            },
                            child: Container(
                              height: 45,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.120,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image: AssetImage("assets/img/png/six.png"),
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
                              widget.screen2Answer['screen3'] = "seven";
                            },
                            child: Container(
                              height: 45,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.120,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/img/png/seven.png"),
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
                              widget.screen2Answer['screen3'] = "eight";
                            },
                            child: Container(
                              height: 45,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.120,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/img/png/eight.png"),
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
                              widget.screen2Answer['screen3'] = "nine";
                            },
                            child: Container(
                              height: 45,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.120,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/img/png/nine.png"),
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
                              widget.screen2Answer['screen3'] = "ten";
                            },
                            child: Container(
                              height: 45,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.120,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image: AssetImage("assets/img/png/ten.png"),
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
                        ],
                      ),
                    ],
                  ),
                ),
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
                                    builder: (BuildContext context) => Screen4(
                                      screen3Answer: widget.screen2Answer,
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
        ),
      ),
    );
  }
}
