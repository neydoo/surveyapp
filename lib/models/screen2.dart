import 'package:surveyapp/custom_widgets/verifi_tap.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/screen3.dart';
import 'package:surveyapp/config/verifi_colors.dart';

// import '../questions.dart';

class Screen2 extends StatefulWidget {
  final Map screen1Answer;

  const Screen2({Key key, this.screen1Answer}) : super(key: key);
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
                screen2Answer: widget.screen1Answer,
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Survey App'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.22,
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
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      // margin: EdgeInsets.all(50),
                      padding: EdgeInsets.only(top: 20, left: 40),
                      child: Row(
                        children: <Widget>[
                          VerifiTap(
                            onTap: () {
                              setState(() {
                                _error = "";
                              });
                              widget.screen1Answer['screen2'] = "1";
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
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
                          VerifiTap(
                            onTap: () {
                              setState(() {
                                _error = "";
                              });
                              widget.screen1Answer['screen2'] = "2";
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
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
                          VerifiTap(
                            onTap: () {
                              setState(() {
                                _error = "";
                              });
                              widget.screen1Answer['screen2'] = "3";
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.120,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/img/png/three.png"),
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
                          VerifiTap(
                            onTap: () {
                              setState(() {
                                _error = "";
                              });
                              widget.screen1Answer['screen2'] = "4";
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.120,
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
                          VerifiTap(
                            onTap: () {
                              setState(() {
                                _error = "";
                              });
                              widget.screen1Answer['screen2'] = "5";
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.120,
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
                      ),
                    ),
                    errorWidget(),
                    Container(
                      margin: EdgeInsets.all(50),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20, left: 30),
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
