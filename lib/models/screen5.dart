import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:surveyapp/models/answersScreen.dart';
import 'package:surveyapp/models/authentication.dart';
import 'package:surveyapp/custom_widgets/verifi_tap.dart';
import 'package:surveyapp/bloc/bloc.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/homeScreen.dart';
import 'package:surveyapp/config/api.dart';
import 'package:http/http.dart' as http;
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:location/location.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart';
// import '../questions.dart';

class Screen5 extends StatefulWidget {
  final Map screen4Answer;
  final TextEditingController email;
  final TextEditingController pname;

  const Screen5({Key key, this.screen4Answer, this.pname, this.email}) : super(key: key);
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  void initState() {
    super.initState();
    location.onLocationChanged().listen((value) {
      setState(() {
        userLocation = value;
      });
    });
  }

  var location = new Location();
  var connectionBloc = ConnectionBloc();

  Map<String, double> userLocation;
  StreamSubscription streamSubscription;
  bool smiley1 = false;
  bool smiley2 = false;
  bool smiley3 = false;
  bool smiley4 = false;
  bool smiley5 = false;

  validateInput() async {
    // print(widget.screen4Answer['name']);
    // print(widget.screen4Answer as String);
    // return false;
    // connectionBloc.checkNetwork();

    if (widget.screen4Answer["screen5"] == null) {
      setState(() {
        _error = "Select an option";
      });

      return false;
    }
    setState(() {
      _error = "";
      _loading = true;
    });
    try {
      // if (connectionBloc.connected == true) {
      print('hello---');
      // await upload();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Final(
            screen5Answer: widget.screen4Answer, pname: widget.pname, email: widget.email
          ),
        ),
      );
      setState(() {
        _loading = false;
      });
      // } else {
      //   print('hello1');
      //   await save();
      //   setState(() {
      //     _loading = false;
      //   });
      // }
      setState(() {
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = "An error occurred";
      });
    }
    // final result = await InternetAddress.lookup('google.com');
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

  readFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      print(directory.toString());
      final file = File('${directory.path}/survey.json');
      List jsonContent = json.decode(file.readAsStringSync());
      setState(() {
        offlineList = jsonContent;
      });
      print(offlineList);
    } catch (e) {
      print("Couldn't read file survey.json : $e");
    }
  }

  save() async {
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

    surveyList.add(inputData);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/survey.json');
    bool fileExists = file.existsSync();

    if (fileExists == true) {
      print("File exists");
      List jsonContent = json.decode(file.readAsStringSync());
      jsonContent.add(inputData);
      file.writeAsStringSync(json.encode(jsonContent));
    } else {
      file.writeAsStringSync(json.encode(surveyList));
      print('saved survey.json');
    }

    setState(() {
      _loading = false;
      _success = "Survey Saved!";
    });

    await readFile();
    var oneSec = Duration(seconds: 3);
    Timer.periodic(oneSec, (Timer t) async {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => Home(),
          settings: RouteSettings(name: 'Home'),
        ),
      );
    });

    // }
  }

  Widget successWidget() {
    if (_success.length > 0) {
      return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 2,
            ),
            Text(
              _success,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                  fontFamily: "Lato"),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      );
    }
    return Container();
  }

  List surveyList = [];
  List offlineList = [];
  String _success = '';
  bool _loading = false;

  Future upload() async {
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
    setState(() {
      _error = "";
      _loading = true;
    });

    try {
      String token = await Authentication.getToken();

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
          _loading = false;
          _error = decodedResponse['message'];
        });
        return;
      }
      setState(() {
        _loading = false;
        _success = 'Survey Saved!';
      });
      print(decodedResponse);

      var oneSec = Duration(seconds: 3);
      Timer.periodic(oneSec, (Timer t) async {
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
            builder: (context) => Home(),
            settings: RouteSettings(name: 'Home'),
          ),
        );
      });
    } catch (e) {
      print(e);
      setState(() {
        _error = "An error occured";
        _loading = false;
      });
      // }
    }
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              // height: MediaQuery.of(context).size.height * 0.22,
                              child: Text(
                                  'Do you feel more accepting of vaccines now?',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          widget.screen4Answer['screen5'] = '1';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '1'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          // margin:
                                          //     widget.screen4Answer['screen5'] == '1'
                                          //         ? EdgeInsets.all(1)
                                          //         : EdgeInsets.all(5),
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '1'
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
                                        'No',
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
                                            smiley2 = true;
                                            smiley3 = false;
                                            smiley4 = false;
                                            smiley5 = false;
                                          });
                                          widget.screen4Answer['screen5'] = '2';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '2'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '2'
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
                                        'Not Really',
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
                                          widget.screen4Answer['screen5'] = '3';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '3'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '3'
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
                                        'Maybe',
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
                                          widget.screen4Answer['screen5'] = '4';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '4'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '4'
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
                                        'A bit',
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
                                          widget.screen4Answer['screen5'] = '5';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '5'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.188
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.145,
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '5'
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
                                        'Yes',
                                        style: TextStyle(color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            _success.length > 0
                                ? successWidget()
                                : errorWidget(),
                            Container(
                              margin: EdgeInsets.all(30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _loading == false
                                      ? Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: ButtonWidget(
                                            danger: true,
                                            text: 'Back',
                                            onTap: () => Navigator.pop(context),
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(
                                              top: 10, left: 80),
                                          child: Container()),
                                  Container(
                                    child: ButtonWidget(
                                        loadingState: _loading,
                                        text: 'Next',
                                        onTap: () async {
                                          await validateInput();
                                        }),
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
                body: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                  'Do you feel more accepting of vaccines now?',
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          widget.screen4Answer['screen5'] = '1';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '1'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.178
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.123,
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '1'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.178
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.123,
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
                                        'No',
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
                                            smiley2 = true;
                                            smiley3 = false;
                                            smiley4 = false;
                                            smiley5 = false;
                                          });
                                          widget.screen4Answer['screen5'] = '2';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '2'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.178
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.123,
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '2'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.178
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.123,
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
                                        'Not Really',
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
                                          widget.screen4Answer['screen5'] = '3';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '3'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.178
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.123,
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '3'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.178
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.123,
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
                                        'Maybe',
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
                                          widget.screen4Answer['screen5'] = '4';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '4'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.175
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.125,
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '4'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.175
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
                                      Text(
                                        'A bit',
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
                                          widget.screen4Answer['screen5'] = '5';
                                        },
                                        child: Container(
                                          height:
                                              widget.screen4Answer['screen5'] ==
                                                      '5'
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.178
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.123,
                                          width:
                                              widget.screen4Answer['screen5'] ==
                                                      '5'
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
                                      Text(
                                        'Yes',
                                        style: TextStyle(color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                            ),
                            _success.length > 0
                                ? successWidget()
                                : errorWidget(),
                            Container(
                              margin: EdgeInsets.all(50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _loading == false
                                      ? Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: ButtonWidget(
                                            danger: true,
                                            text: 'Back',
                                            onTap: () => Navigator.pop(context),
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(
                                              top: 10, left: 80),
                                          child: Container()),
                                  Container(
                                    child: ButtonWidget(
                                        loadingState: _loading,
                                        text: 'Next',
                                        onTap: () async {
                                          await validateInput();
                                        }),
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
    });
  }
}
