import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/homeScreen.dart';
import 'package:surveyapp/config/api.dart';
import 'package:surveyapp/models/authentication.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:location/location.dart';
// import '../questions.dart';

class Screen5 extends StatefulWidget {
  final Map screen4Answer;

  const Screen5({Key key, this.screen4Answer}) : super(key: key);
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  Map answers = {};
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

  validateInput() {
    // print(widget.screen4Answer['name']);
    // print(widget.screen4Answer as String);
    // return false;
    setState(() {
      _error = "";
    });

    if (widget.screen4Answer["screen5"] == null) {
      setState(() {
        _error = "Select an option";
      });

      return false;
    }
    return save();
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

  Future save() async {
    // print(widget.screen4Answer);

    Map<String, dynamic> inputData = {
      "answer1": widget.screen4Answer['screen1'],
      "answer2": widget.screen4Answer['screen2'],
      "answer3": widget.screen4Answer['screen3'],
      "answer4": widget.screen4Answer['screen4'],
      "answer5": widget.screen4Answer['screen5'],
      "fullName": widget.screen4Answer['name'],
      "play": widget.screen4Answer['play'],
      "email": widget.screen4Answer['email'],
      'lat': userLocation["latitude"].toString(),
      'lng': userLocation["longitude"].toString()
    };

    try {
      String token = await Authentication.getToken();
      print('here');
      print(userLocation["longitude"].toString());
      http.Response response = await http.post(
        API.save,
        body: json.encode(inputData),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
      );

      var decodedResponse = json.decode(response.body);
      int statusCode = response.statusCode;
      print(decodedResponse);

      if (statusCode != 200) {
        setState(() {
          _error = decodedResponse['message'];
        });
        return;
      }
      print(decodedResponse);

      // redirect to dashboard
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => Home(),
          settings: RouteSettings(name: 'Home'),
        ),
      );
    } catch (e) {
      print(e);
      // set error
      setState(() {
        _error = "An error occured";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
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
                              'Do you feel more accepting of vaccines now?',
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
                                _error = "";
                              });
                              widget.screen4Answer['screen5'] = '1';
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
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
                              widget.screen4Answer['screen5'] = '2';
                            },
                            child: Container(
                              height: 52,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
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
                              widget.screen4Answer['screen5'] = '3';
                            },
                            child: Container(
                              height: 52,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _error = "";
                              });
                              widget.screen4Answer['screen5'] = '4';
                            },
                            child: Container(
                              height: 52,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
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
                              setState(() {
                                _error = "";
                              });
                              widget.screen4Answer['screen5'] = '5';
                            },
                            child: Container(
                              height: 52,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.145,
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
                          ),
                          // ])
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
                          ButtonWidget(
                              text: 'Submit',
                              onTap: () async {
                                await validateInput();
                              }),
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
