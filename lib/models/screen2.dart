import 'package:surveyapp/custom_widgets/verifi_tap.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/screen3.dart';
import 'package:surveyapp/config/verifi_colors.dart';

// import '../questions.dart';

class Screen2 extends StatefulWidget {
  final Map screen1Answer;
  final TextEditingController pname;
  final TextEditingController email;

  const Screen2({Key key, this.screen1Answer,this.pname,this.email}) : super(key: key);
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  validateInput() {
    setState(() {
      _error = "";
    });
    if (widget.screen1Answer["screen2"] == null) {
      setState(() {
        _error = "Select an option";
      });

      return false;
    }
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Screen3(
                screen2Answer: widget.screen1Answer, pname: widget.pname, email: widget.email
              )),
    );
  }

  String _error = "";

  bool smiley1 = false;
  bool smiley2 = false;
  bool smiley3 = false;
  bool smiley4 = false;
  bool smiley5 = false;

  Widget errorWidget() {
    if (_error.length > 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          Text(
            _error,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
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
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text('Survey App'),
                ),
                body: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                  'How did you feel about the length of the play?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  )),
                            ),
                            Container(
                              width: double.infinity,
                              // margin: EdgeInsets.only(bottom: 50),
                              // padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley1 = true;
                                          smiley2 = false;
                                          smiley3 = false;
                                          smiley4 = false;
                                          smiley5 = false;
                                        });
                                        widget.screen1Answer['screen2'] = "1";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen1Answer['screen2'] ==
                                                    "1"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.188
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.145,
                                        margin:
                                            widget.screen1Answer['screen2'] ==
                                                    "1"
                                                ? EdgeInsets.all(1)
                                                : EdgeInsets.all(1),
                                        width:
                                            widget.screen1Answer['screen2'] ==
                                                    "1"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.188
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.145,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/emoji_1.png"),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.1),
                                                blurRadius: 19.5,
                                                offset: Offset(0, 6),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                                    Text(
                                      'Terrible',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ]),
                                  Column(children: <Widget>[
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley1 = false;
                                          smiley2 = true;
                                          smiley3 = false;
                                          smiley4 = false;
                                          smiley5 = false;
                                        });
                                        widget.screen1Answer['screen2'] = "2";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen1Answer['screen2'] ==
                                                    "2"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.188
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.145,
                                        margin:
                                            widget.screen1Answer['screen2'] ==
                                                    "2"
                                                ? EdgeInsets.all(1)
                                                : EdgeInsets.all(5),
                                        width:
                                            widget.screen1Answer['screen2'] ==
                                                    "2"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.188
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.145,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/emoji_2.png"),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.1),
                                                blurRadius: 19.5,
                                                offset: Offset(0, 6),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                                    Text(
                                      'Bad',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ]),
                                  Column(
                                    children: <Widget>[
                                      VerifiTap(
                                        onTap: () {
                                          setState(() {
                                            _error = "";
                                            smiley1 = false;
                                            smiley2 = false;
                                            smiley3 = true;
                                            smiley4 = false;
                                            smiley5 = false;
                                          });
                                          widget.screen1Answer['screen2'] = "3";
                                        },
                                        child: Container(
                                          height:
                                              widget.screen1Answer['screen2'] ==
                                                      "3"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          margin:
                                              widget.screen1Answer['screen2'] ==
                                                      "3"
                                                  ? EdgeInsets.all(1)
                                                  : EdgeInsets.all(5),
                                          width:
                                              widget.screen1Answer['screen2'] ==
                                                      "3"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          decoration: BoxDecoration(
                                              // color: VerifiColors.blue,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/png/emoji_3.png"),
                                                fit: BoxFit.cover,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1),
                                                  blurRadius: 19.5,
                                                  offset: Offset(0, 6),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                        ),
                                      ),
                                      Text(
                                        'Okay',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      VerifiTap(
                                        onTap: () {
                                          setState(() {
                                            _error = "";
                                            smiley1 = false;
                                            smiley2 = false;
                                            smiley3 = false;
                                            smiley4 = true;
                                            smiley5 = false;
                                          });
                                          widget.screen1Answer['screen2'] = "4";
                                        },
                                        child: Container(
                                          height:
                                              widget.screen1Answer['screen2'] ==
                                                      "4"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          margin:
                                              widget.screen1Answer['screen2'] ==
                                                      "4"
                                                  ? EdgeInsets.all(1)
                                                  : EdgeInsets.all(5),
                                          width:
                                              widget.screen1Answer['screen2'] ==
                                                      "4"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          decoration: BoxDecoration(
                                              // color: VerifiColors.blue,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/png/emoji_4.png"),
                                                fit: BoxFit.cover,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1),
                                                  blurRadius: 19.5,
                                                  offset: Offset(0, 6),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                        ),
                                      ),
                                      Text(
                                        'Good',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      VerifiTap(
                                        onTap: () {
                                          setState(() {
                                            _error = "";
                                            smiley1 = false;
                                            smiley2 = false;
                                            smiley3 = false;
                                            smiley4 = false;
                                            smiley5 = true;
                                          });
                                          widget.screen1Answer['screen2'] = "5";
                                        },
                                        child: Container(
                                          height:
                                              widget.screen1Answer['screen2'] ==
                                                      "5"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          margin: smiley5 == true
                                              ? EdgeInsets.all(1)
                                              : EdgeInsets.all(5),
                                          width: smiley5 == true
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.188
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.145,
                                          decoration: BoxDecoration(
                                              // color: VerifiColors.blue,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/png/emoji_5.png"),
                                                fit: BoxFit.cover,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1),
                                                  blurRadius: 19.5,
                                                  offset: Offset(0, 6),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                        ),
                                      ),
                                      Text(
                                        'Great',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            errorWidget(),
                            Container(
                              margin: EdgeInsets.all(50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: ButtonWidget(
                                      danger: true,
                                      text: 'Back',
                                      onTap: () => Navigator.pop(context),
                                    ),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.all(10),
                                    child: ButtonWidget(
                                      text: 'Next',
                                      onTap: () => validateInput(),
                                    ),
                                  ),
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
            )
          : MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text('Survey App'),
                ),
                body: ListView(
                  // margin: EdgeInsets.only(top: 20),
                  // children: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              width: double.infinity,
                              // margin: EdgeInsets.all(50),
                              padding: EdgeInsets.all(20),
                              child: Text(
                                  'How did you feel about the length of the play?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  )
                                  // textAlign: TextAlign.center,
                                  ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            // margin: EdgeInsets.all(50),
                            // padding: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley1 = true;
                                          smiley2 = false;
                                          smiley3 = false;
                                          smiley4 = false;
                                          smiley5 = false;
                                        });
                                        widget.screen1Answer['screen2'] = "1";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen1Answer['screen2'] ==
                                                    "1"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.35
                                                : MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.25,
                                        margin: widget
                                                    .screen1Answer['screen2'] ==
                                                "1"
                                            ? EdgeInsets.only(top: 5, right: 30)
                                            : EdgeInsets.only(top: 5),
                                        width:
                                            widget.screen1Answer['screen2'] ==
                                                    "1"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.35
                                                : MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.25,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/emoji_1.png"),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.1),
                                                blurRadius: 19.5,
                                                offset: Offset(0, 6),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                                    Text('Terrible',
                                        style: TextStyle(color: Colors.black87))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley1 = false;
                                          smiley2 = true;
                                          smiley3 = false;
                                          smiley4 = false;
                                          smiley5 = false;
                                        });
                                        widget.screen1Answer['screen2'] = "2";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen1Answer['screen2'] ==
                                                    "2"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.178
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.125,
                                        margin:
                                            widget.screen1Answer['screen2'] ==
                                                    "2"
                                                ? EdgeInsets.only(
                                                    top: 5, left: 35, right: 30)
                                                : EdgeInsets.all(10),
                                        width:
                                            widget.screen1Answer['screen2'] ==
                                                    "2"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.178
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.125,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/emoji_2.png"),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.1),
                                                blurRadius: 19.5,
                                                offset: Offset(0, 6),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                                    Text('Bad',
                                        style: TextStyle(color: Colors.black87))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley1 = false;
                                          smiley2 = false;
                                          smiley3 = true;
                                          smiley4 = false;
                                          smiley5 = false;
                                        });
                                        widget.screen1Answer['screen2'] = "3";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen1Answer['screen2'] ==
                                                    "3"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.178
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.125,
                                        margin:
                                            widget.screen1Answer['screen2'] ==
                                                    "3"
                                                ? EdgeInsets.only(
                                                    top: 5, left: 35, right: 30)
                                                : EdgeInsets.all(5),
                                        width:
                                            widget.screen1Answer['screen2'] ==
                                                    "3"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.178
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.125,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/emoji_3.png"),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.1),
                                                blurRadius: 19.5,
                                                offset: Offset(0, 6),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                                    Text('Okay',
                                        style: TextStyle(color: Colors.black87))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley1 = false;
                                          smiley2 = false;
                                          smiley3 = false;
                                          smiley4 = true;
                                          smiley5 = false;
                                        });
                                        widget.screen1Answer['screen2'] = "4";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen1Answer['screen2'] ==
                                                    "4"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.178
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.125,
                                        margin:
                                            widget.screen1Answer['screen2'] ==
                                                    "4"
                                                ? EdgeInsets.only(
                                                    top: 5, left: 35, right: 30)
                                                : EdgeInsets.all(5),
                                        width:
                                            widget.screen1Answer['screen2'] ==
                                                    "4"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.178
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.125,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/emoji_4.png"),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.1),
                                                blurRadius: 19.5,
                                                offset: Offset(0, 6),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                                    Text('Good',
                                        style: TextStyle(color: Colors.black87))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley1 = false;
                                          smiley2 = false;
                                          smiley3 = false;
                                          smiley4 = false;
                                          smiley5 = true;
                                        });
                                        widget.screen1Answer['screen2'] = "5";
                                      },
                                      child: Container(
                                        height: smiley5 == true
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.178
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.125,
                                        margin: smiley5 == true
                                            ? EdgeInsets.only(
                                                top: 5, left: 35, right: 30)
                                            : EdgeInsets.all(5),
                                        width: smiley5 == true
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.178
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.125,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/emoji_5.png"),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.1),
                                                blurRadius: 19.5,
                                                offset: Offset(0, 6),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                                    Text('Great',
                                        style: TextStyle(color: Colors.black87))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                          ),
                          errorWidget(),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: ButtonWidget(
                                    danger: true,
                                    text: 'Back',
                                    onTap: () => Navigator.pop(context),
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.all(10),
                                  child: ButtonWidget(
                                    text: 'Next',
                                    onTap: () => validateInput(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ),
            );
    });
  }
}
