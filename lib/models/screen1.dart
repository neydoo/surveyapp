import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
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
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                              setState((){
                              _error = "";
                            });
                              widget.answers['screen1'] = "1";
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/png/emoji_1.png"),
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
                              setState(() {});
                              setState((){
                              _error = "";
                            });
                              widget.answers['screen1'] = "2";
                            },
                            child: Container(
                              height: 52,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/png/emoji_2.png"),
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
                              setState((){
                              _error = "";
                            });
                              widget.answers['screen1'] = "3";
                            },
                            child: Container(
                              height: 52,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/png/emoji_3.png"),
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
                              setState((){
                              _error = "";
                            });
                              widget.answers['screen1'] = "4";
                            },
                            child: Container(
                              height: 52,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/png/emoji_4.png"),
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
                              setState((){
                              _error = "";
                            });
                              widget.answers['screen1'] = "5";
                            },
                            child: Container(
                              height: 52,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
                              decoration: BoxDecoration(
                                  // color: VerifiColors.blue,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/png/emoji_5.png"),
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
                    // Container(
                    //   margin: EdgeInsets.all(50),
                    // child:
                    errorWidget(),
                    // ),
                    Container(
                      margin: EdgeInsets.all(50),
                      child: Row(
                        children: [
                          ButtonWidget(
                            danger: true,
                            text: 'Back',
                            onTap: () => Navigator.pop(context),
                          ),
                          ButtonWidget(
                            text: 'Next',
                            onTap: () => validateInput(),
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
