import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:surveyapp/homeScreen.dart';
import 'package:surveyapp/config/api.dart';
import 'package:surveyapp/models/authentication.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
// import 'package:surveyapp/config/verifi_colors.dart';
// import 'package:location/location.dart';
import 'package:path_provider/path_provider.dart';
import 'package:surveyapp/models/login.dart';
import 'package:surveyapp/models/user_data.dart';
import 'package:surveyapp/bloc/connection_bloc.dart';
import 'package:surveyapp/bloc/connection_event.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

StreamSubscription streamSubscription;

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    runCheck();
  }

  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  var connectionBloc = ConnectionBloc();

  runCheck() {
    print('start running check-');
    var oneSec = Duration(seconds: 60);
    Timer.periodic(oneSec, (Timer t) async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/survey.json');
      bool fileExists = file.existsSync();
      connectionBloc.dispatch(CheckInternet());
      final result = await InternetAddress.lookup('google.com');
      if (fileExists == false) {
        print("file doesn't exists");
        print('done with check- no file');
        // return;
      }
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (fileExists == true) {
          print('file exists');
          print('start upload of offline data');
          submitOffline();
        }
      }
      connectionBloc.dispatch(CheckInternet());
    });
    return null;
  }

  submitOffline() async {
    print('check internet and begin upload');
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
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
          "phone": '',
          "sex": '',
          "comment": '',
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
          data['comment'] = jsonContent[i]['comment'];
          data['phone'] = jsonContent[i]['phone'];
          data['sex'] = jsonContent[i]['sex'];
          data['lng'] = jsonContent[i]['lng'];
          data['lat'] = jsonContent[i]['lat'];

          try {
            String token = await Authentication.getToken();

            print('sending offline data');

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
            print(statusCode);
            if (statusCode == 200) {
              // if (statusCode == 200 && jsonContent[i] == jsonContent.length - 1) {
              print(decodedResponse);

              print('-------------------------------');
              print(jsonContent[i]);
              setState(() {
                offlineList = [];
              });
              print('file sent');
            } else {
              print('------------!!!!!!!!!!!!!!--------');
              return print('file not sent');
            }
          } catch (e) {
            return print("error: $e");
          }
        }
        return deleteFile();
      } catch (e) {
        print("error: $e");
      }
    }
    return print('no internet');
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
    print('deleting');
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/survey.json');
    file.deleteSync(recursive: true);
    setState(() {
      deletable = false;
    });
  }

  List offlineList = [];
  bool deletable = false;

  Widget build(BuildContext context) {
    return buildPage(context);
  }

  buildPage(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? WillPopScope(
                child: MaterialApp(
                  home: Scaffold(
                    appBar: AppBar(
                      title: Text('Survey App'),
                    ),
                    body: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.35),
                            child: RaisedButton(
                              child: Text('Start Survey'),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => User()),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: FlatButton(
                              child: Text("Logout >>"),
                              onPressed: () async {
                                await Authentication.logout();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Login(),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onWillPop: () {
                  return showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirm Exit"),
                          content: Text("Are you sure you want to exit?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("YES"),
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                            ),
                            FlatButton(
                              child: Text("NO"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                  // return Future.value(true);
                },
              )
            : WillPopScope(
                child: MaterialApp(
                  home: Scaffold(
                    appBar: AppBar(
                      title: Text('Survey App'),
                    ),
                    body: Center(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 200),
                            child: RaisedButton(
                              child: Text('Start Survey'),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => User()),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 150),
                            child: FlatButton(
                              child: Text("Logout >>"),
                              onPressed: () async {
                                await Authentication.logout();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Login(),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onWillPop: () {
                  return showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirm Exit"),
                          content: Text("Are you sure you want to exit?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("YES"),
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                            ),
                            FlatButton(
                              child: Text("NO"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                  // return Future.value(true);
                },
              );
      },
    );
  }
}
