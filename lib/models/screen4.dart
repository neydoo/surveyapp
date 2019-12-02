import 'package:surveyapp/custom_widgets/verifi_tap.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/screen5.dart';
import 'package:surveyapp/config/verifi_colors.dart';

// import '../questions.dart';

class Screen4 extends StatefulWidget {
  final Map screen3Answer;

  const Screen4({Key key, this.screen3Answer}) : super(key: key);

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  validateInput() {
    setState(() {
      _error = "";
    });
    if (widget.screen3Answer["screen4"] == null) {
      setState(() {
        _error = "Select an option";
      });

      return false;
    }
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Screen5(
          screen4Answer: widget.screen3Answer,
        ),
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
                                VerifiTap(
                                  onTap: () {
                                    setState(() {
                                      _error = "";
                                    });
                                    widget.screen3Answer['screen4'] = '1';
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
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 19.5,
                                            offset: Offset(0, 6),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                ),
                                VerifiTap(
                                  onTap: () {
                                    setState(() {
                                      _error = "";
                                    });
                                    widget.screen3Answer['screen4'] = '2';
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
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 19.5,
                                            offset: Offset(0, 6),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                ),
                                VerifiTap(
                                  onTap: () {
                                    setState(() {
                                      _error = "";
                                    });
                                    widget.screen3Answer['screen4'] = '3';
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
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
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
                            ),
                          ),
                          errorWidget(),
                          Container(
                            margin: EdgeInsets.all(30),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 40,right: 20),
                                  child: ButtonWidget(
                                    danger: true,
                                    text: 'Back',
                                    onTap: () => Navigator.pop(context),
                                  ),
                                ),
                                Container(
                                  child: ButtonWidget(
                                    text: 'Next',
                                    onTap: () => validateInput(),
                                  ),
                                )
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
