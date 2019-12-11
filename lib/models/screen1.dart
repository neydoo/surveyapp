import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/custom_widgets/verifi_tap.dart';
import 'package:surveyapp/models/screen2.dart';
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:location/location.dart';

// import '../questions.dart';

class Screen1 extends StatefulWidget {
  final Map answers;
  final TextEditingController pname;
  final TextEditingController email;

  const Screen1({Key key, this.answers, this.email, this.pname})
      : super(key: key);
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  void initState() {
    super.initState();

    location.onLocationChanged().listen((value) {
      setState(() {
        userLocation = value;
      });
    });
  }

  var location = new Location();

  Map<String, double> userLocation;

  bool smiley1 = false;
  bool smiley2 = false;
  bool smiley3 = false;
  bool smiley4 = false;
  bool smiley5 = false;

  // Map answers = {};
  validateInput() {
    setState(() {
      _error = "";
    });
    if (widget.answers["screen1"] == null) {
      setState(() {
        _error = "Select an option";
      });

      return false;
    }
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Screen2(
            screen1Answer: widget.answers,
            pname: widget.pname,
            email: widget.email),
      ),
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
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20),
                              // height: MediaQuery.of(context).size.height * 0.22,
                              child:
                                  Text('How did the perfomance make you feel?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                      )
                                      // textAlign: TextAlign.center,
                                      ),
                            ),
                            Container(
                              width: double.infinity,
                              // margin: EdgeInsets.all(50),
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      VerifiTap(
                                        onTap: () {
                                          // setState(() {});
                                          setState(() {
                                            _error = "";
                                            smiley1 = true;
                                            smiley2 = false;
                                            smiley3 = false;
                                            smiley4 = false;
                                            smiley5 = false;
                                          });
                                          widget.answers['screen1'] = "1";
                                        },
                                        child: Container(
                                          height:
                                              widget.answers['screen1'] == "1"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          margin:
                                              widget.answers['screen1'] == "1"
                                                  ? EdgeInsets.all(1)
                                                  : EdgeInsets.all(5),
                                          width:
                                              widget.answers['screen1'] == "1"
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
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Terrible',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      VerifiTap(
                                        onTap: () {
                                          // setState(() {});
                                          setState(() {
                                            _error = "";
                                            smiley1 = false;
                                            smiley2 = true;
                                            smiley3 = false;
                                            smiley4 = false;
                                            smiley5 = false;
                                          });
                                          widget.answers['screen1'] = "2";
                                        },
                                        child: Container(
                                          height:
                                              widget.answers['screen1'] == "2"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          margin:
                                              widget.answers['screen1'] == "2"
                                                  ? EdgeInsets.all(1)
                                                  : EdgeInsets.all(5),
                                          width:
                                              widget.answers['screen1'] == "2"
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
                                      )
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
                                          widget.answers['screen1'] = "3";
                                        },
                                        child: Container(
                                          height:
                                              widget.answers['screen1'] == "3"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          margin:
                                              widget.answers['screen1'] == "3"
                                                  ? EdgeInsets.all(1)
                                                  : EdgeInsets.all(5),
                                          width:
                                              widget.answers['screen1'] == "3"
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
                                      )
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
                                          widget.answers['screen1'] = "4";
                                        },
                                        child: Container(
                                          height:
                                              widget.answers['screen1'] == "4"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          margin:
                                              widget.answers['screen1'] == "4"
                                                  ? EdgeInsets.all(1)
                                                  : EdgeInsets.all(5),
                                          width:
                                              widget.answers['screen1'] == "4"
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
                                      )
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
                                          widget.answers['screen1'] = "5";
                                        },
                                        child: Container(
                                          height:
                                              widget.answers['screen1'] == "5"
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          margin:
                                              widget.answers['screen1'] == "5"
                                                  ? EdgeInsets.all(1)
                                                  : EdgeInsets.all(5),
                                          width:
                                              widget.answers['screen1'] == "5"
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
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Great',
                                        style: TextStyle(color: Colors.black87),
                                      )
                                    ],
                                  ),
                                  // ])
                                ],
                              ),
                            ),

                            errorWidget(),
                            // ),
                            Container(
                              margin: EdgeInsets.all(30),
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
                body: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ListView(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                // height: MediaQuery.of(context).size.height * 0.52,
                                child: Text(
                                  'How did the perfomance make you feel?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                // width: double.infinity,
                                // margin: EdgeInsets.all(50),
                                // padding: EdgeInsets.all(20),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          VerifiTap(
                                            onTap: () {
                                              setState(() {});
                                              setState(() {
                                                _error = "";
                                                smiley1 = false;
                                                smiley2 = true;
                                                smiley3 = false;
                                                smiley4 = false;
                                                smiley5 = false;
                                              });
                                              widget.answers['screen1'] = "1";
                                            },
                                            child: Container(
                                              height:
                                                  widget.answers['screen1'] ==
                                                          "1"
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.178
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.125,
                                              width:
                                                  widget.answers['screen1'] ==
                                                          "1"
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                          ),
                                          Text(
                                            'Terrible',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          VerifiTap(
                                            onTap: () {
                                              setState(() {});
                                              setState(() {
                                                _error = "";
                                                smiley1 = false;
                                                smiley2 = true;
                                                smiley3 = false;
                                                smiley4 = false;
                                                smiley5 = false;
                                              });
                                              widget.answers['screen1'] = "2";
                                            },
                                            child: Container(
                                              height:
                                                  widget.answers['screen1'] ==
                                                          "2"
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.178
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.125,
                                              width:
                                                  widget.answers['screen1'] ==
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                          ),
                                          Text(
                                            'Bad',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
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
                                              widget.answers['screen1'] = "3";
                                            },
                                            child: Container(
                                              height:
                                                  widget.answers['screen1'] ==
                                                          "3"
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.178
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.125,
                                              width:
                                                  widget.answers['screen1'] ==
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                          ),
                                          Text(
                                            'Okay',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
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
                                              widget.answers['screen1'] = "4";
                                            },
                                            child: Container(
                                              height:
                                                  widget.answers['screen1'] ==
                                                          "4"
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.178
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.125,
                                              width:
                                                  widget.answers['screen1'] ==
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                          ),
                                          Text(
                                            'Good',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
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
                                              widget.answers['screen1'] = "5";
                                            },
                                            child: Container(
                                              height:
                                                  widget.answers['screen1'] ==
                                                          "5"
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.178
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.125,
                                              width:
                                                  widget.answers['screen1'] ==
                                                          "5"
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                          ),
                                          Text(
                                            'Great',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.all(10),
                              ),
                              errorWidget(),
                              // ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 30, bottom: 50),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
