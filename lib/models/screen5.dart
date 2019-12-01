import 'package:flutter/material.dart';
import 'package:surveyapp/bloc/bloc.dart';
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
import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart';
// import '../questions.dart';

class Screen5 extends StatefulWidget {
  final Map screen4Answer;

  const Screen5({Key key, this.screen4Answer}) : super(key: key);
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  // final connectionBloc = ConnectionBloc();
  Map answers = {};
  void initState() {
    super.initState();
    // runCheck();
    location.onLocationChanged().listen((value) {
      setState(() {
        userLocation = value;
      });
    });
  }

  var location = new Location();
  var connectionBloc = ConnectionBloc();

  Map<String, double> userLocation;

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

    if (connectionBloc.connected == true) {
      print('hello---');
      await upload();
    } else {
      // report();
      print('hello1');
      print(connectionBloc.connected);
      await save();
    }
    setState(() {
      _loading = false;
    });
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

  runCheck() {
    var oneSec = Duration(seconds: 3);
    Timer.periodic(oneSec, (Timer t) async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/survey.json');
      bool fileExists = file.existsSync();
      connectionBloc.dispatch(CheckInternet());
      if (fileExists == true) {
        submitOffline();
      }
      connectionBloc.dispatch(CheckInternet());
    });
    return null;
  }

  submitOffline() async {
    // if (connectionBloc.connected == true) {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/survey.json');
    List jsonContent = json.decode(file.readAsStringSync());

    Map data = {
      "answer1": '',
      "answer2": '',
      "answer3": '',
      "answer4": '',
      "answer5": '',
      "fullName": '',
      "play": '',
      "email": '',
      'lat': '',
      'lng': ''
    };

    for (var i = 0; i < jsonContent.length; i++) {
      data['answer1'] = jsonContent[i]['answer1'];
      data['answer2'] = jsonContent[i]['answer2'];
      data['answer3'] = jsonContent[i]['answer3'];
      data['answer4'] = jsonContent[i]['answer4'];
      data['answer5'] = jsonContent[i]['answer5'];
      data['fullName'] = jsonContent[i]['fullName'];
      data['play'] = jsonContent[i]['play'];
      data['email'] = jsonContent[i]['email'];
      data['lon'] = jsonContent[i]['lon'];
      data['lat'] = jsonContent[i]['lat'];

      try {
        String token = await Authentication.getToken();

        // print('saving offline');

        http.Response response = await http.post(
          API.save,
          body: json.encode(data),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: "Bearer $token"
          },
        );

        var decodedResponse = json.decode(response.body);
        int statusCode = response.statusCode;
        if (statusCode == 200) {
          print(decodedResponse);

          setState(() {
            offlineList = [];
          });
        }
      } catch (e) {
        print("error: $e");
      }
    }
    if (offlineList.length < 1) {
      deleteFile();
    }
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

  deleteFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/survey.json');
    // file.deleteSync(recursive: true);
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

    // if (connectionBloc.connected == false) {
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
      _success = "Survey Saved!";
    });

    await readFile();
    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(
        builder: (context) => Home(),
        settings: RouteSettings(name: 'Home'),
      ),
    );
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
    // print(widget.screen4Answer);

    // if (connectionBloc.connected == true) {
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
      // }
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
                    _success.length > 0 ? successWidget() : errorWidget(),
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
                              loadingState: _loading,
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
