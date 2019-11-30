import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/screen4.dart';
import 'package:surveyapp/config/verifi_colors.dart';

// import '../questions.dart';

class Screen3 extends StatefulWidget {
  final Map screen2Answer;

  const Screen3({Key key, this.screen2Answer}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  validateInput() {
    setState(() {
      _error = "";
    });
    if (widget.screen2Answer["screen3"] == null) {
      setState(() {
        _error = "Select an option";
      });

      return false;
    }
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Screen4(
                screen3Answer: widget.screen2Answer,
              )),
    );
  }

  String _error = "";
  Widget errorWidget() {
    if (_error.length > 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 2,
          ),
          Text(
            _error,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: VerifiColors.red,
                fontFamily: "Lato"),
          ),
        ],
      );
    }
    return Container();
  }

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
                  padding: EdgeInsets.only(left: 50, top: 20),
                  child: Column(
                    children: [
                      Row(children: <Widget>[
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       // answer = "1";
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
                              _error = "";
                            });
                            widget.screen2Answer['screen3'] = "1";
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
                              _error = "";
                            });
                            widget.screen2Answer['screen3'] = "2";
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
                              _error = "";
                            });
                            widget.screen2Answer['screen3'] = "3";
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
                              _error = "";
                            });
                            widget.screen2Answer['screen3'] = "4";
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
                            setState(() {
                              _error = "";
                            });
                            widget.screen2Answer['screen3'] = "5";
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
                              setState(() {
                                _error = "";
                              });
                              widget.screen2Answer['screen3'] = "6";
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
                              setState(() {
                                _error = "";
                              });
                              widget.screen2Answer['screen3'] = "7";
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
                              setState(() {
                                _error = "";
                              });
                              widget.screen2Answer['screen3'] = "8";
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
                              setState(() {
                                _error = "";
                              });
                              widget.screen2Answer['screen3'] = "9";
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
                              setState(() {
                                _error = "";
                              });
                              widget.screen2Answer['screen3'] = "10";
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
                errorWidget(),
                Container(
                  margin: EdgeInsets.all(50),
                  child: Row(
                    children: [
                      ButtonWidget(
                        danger: true,
                        text: 'Back',
                        onTap: () => Navigator.pop(context),
                      ),
                      ButtonWidget(text: 'Next', onTap: () => validateInput()),
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
