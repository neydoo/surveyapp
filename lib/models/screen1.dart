import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/custom_widgets/verifi_tap.dart';
import 'package:surveyapp/models/screen2.dart';
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:location/location.dart';

// import '../questions.dart';

class Screen1 extends StatefulWidget {
  final Map answers;

  const Screen1({Key key, this.answers}) : super(key: key);
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with TickerProviderStateMixin {
  Animation<double> _scaleAnimation;
  AnimationController _animationController;

  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));

    _scaleAnimation =
        Tween<double>(begin: 1, end: 2).animate(_animationController);

    location.onLocationChanged().listen((value) {
      setState(() {
        userLocation = value;
      });
    });
  }

  bool smiley1 = false;
  bool smiley2 = false;
  bool smiley3 = false;
  bool smiley4 = false;
  bool smiley5 = false;

  var location = new Location();

  Map<String, double> userLocation;

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
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 200,
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
                          child: Text('How did the perfomance make you feel?',
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
                              widget.answers['screen1'] = "1";
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              height: smiley1 == false ? 50 : 80,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/img/png/emoji_1.png"),
                                  fit: BoxFit.contain,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    blurRadius: 19.5,
                                    offset: Offset(0, 6),
                                  )
                                ],
                              ),
                            ),
                          ),
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
                              widget.answers['screen1'] = "2";
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              height: smiley2 == false ? 50 : 80,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/png/emoji_2.png"),
                                    fit: BoxFit.contain,
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
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              height: smiley3 == false ? 50 : 80,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/png/emoji_3.png"),
                                    fit: BoxFit.contain,
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
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              height: smiley4 == false ? 50 : 80,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/png/emoji_4.png"),
                                    fit: BoxFit.contain,
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
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              height: smiley5 == false ? 50 : 80,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/png/emoji_5.png"),
                                    fit: BoxFit.contain,
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
                      ),
                    ),

                    errorWidget(),
                    // ),
                    Container(
                      margin: EdgeInsets.all(30),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 40, right: 20),
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
    );
  }
}
