import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:surveyapp/custom_widgets/form_input_widget.dart';
import 'package:surveyapp/endScreen.dart';
import 'package:surveyapp/models/authentication.dart';
import 'package:surveyapp/bloc/bloc.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/config/api.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:path_provider/path_provider.dart';

class Final extends StatefulWidget {
  final Map screen5Answer;
  final TextEditingController email;
  final TextEditingController pname;

  const Final({Key key, this.screen5Answer, this.pname, this.email})
      : super(key: key);

  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
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

  bool _loading = false;
  var connectionBloc = ConnectionBloc();

  // controllers for our inputs

  // nodes for our inputs
  static FocusNode _nodeText1 = FocusNode();

  static TextEditingController comments = TextEditingController();

  validateInput() async {
    print(connectionBloc.connected);
    print(widget.screen5Answer['email']);
    // print(widget.screen5Answer as String);
    setState(() {
      _error = "";
      _loading = true;
    });
    // return false;
    // connectionBloc.checkNetwork();

    try {
      if (connectionBloc.connected == true) {
        print('hello---');
        await upload();
        //   Navigator.push(
        // context,
        // MaterialPageRoute(
        //   builder: (BuildContext context) => Final(
        //     screen5Answer: widget.screen5Answer,
        //   ),
        // ),
        // );
        setState(() {
          _loading = false;
        });
      } else {
        print('hello1');
        await save();
        setState(() {
          _loading = false;
        });
      }
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
      "answer1": widget.screen5Answer['screen1'],
      "answer2": widget.screen5Answer['screen2'],
      "answer3": widget.screen5Answer['screen3'],
      "answer4": widget.screen5Answer['screen4'],
      "answer5": widget.screen5Answer['screen5'],
      "fullName": widget.screen5Answer['name'],
      "sex": widget.screen5Answer['sex'],
      "phone": widget.screen5Answer['phone'],
      'lat': userLocation["latitude"].toString(),
      'lng': userLocation["longitude"].toString(),
      "comment": comments.text
    };
print('inputData:-----');
print(inputData);
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
      // _success = "Survey Saved!";
    });

    await readFile();
    widget.email.text = '';
    widget.pname.text = '';
    comments.text = '';
    var oneSec = Duration(seconds: 3);
    Timer.periodic(oneSec, (Timer t) async {
      setState(() {
        _loading = false;
        // _success = "Survey Saved!";
      });
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => End(),
          settings: RouteSettings(name: 'End'),
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

  Future upload() async {
    Map<String, dynamic> inputData = {
      "answer1": widget.screen5Answer['screen1'],
      "answer2": widget.screen5Answer['screen2'],
      "answer3": widget.screen5Answer['screen3'],
      "answer4": widget.screen5Answer['screen4'],
      "answer5": widget.screen5Answer['screen5'],
      "fullName": widget.screen5Answer['name'],
      "sex": widget.screen5Answer['sex'],
      "phone": widget.screen5Answer['phone'],
      'lat': userLocation["latitude"].toString(),
      'lng': userLocation["longitude"].toString(),
      "comment": comments.text
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
        // _success = 'Survey Saved!';
      });
      print(decodedResponse);

      var oneSec = Duration(seconds: 3);
      Timer.periodic(oneSec, (Timer t) async {
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
            builder: (context) => End(),
            settings: RouteSettings(name: 'End'),
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

// stores the error state
  String _error = "";
  // String _success = "";
  String _emailError = "";
  String _nameError = "";
  String _playError = "";
  String sex = "Male";
  // bool _successloading = false;

// shows the error on the screen if present
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

// shows the error on the screen if present
  Widget nameErrorWidget() {
    if (_nameError.length > 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 2,
          ),
          Text(
            _nameError,
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

  Widget emailErrorWidget() {
    if (_emailError.length > 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 2,
          ),
          Text(
            _emailError,
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

  Widget playErrorWidget() {
    if (_playError.length > 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 2,
          ),
          Text(
            _playError,
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
          ? Scaffold(
              resizeToAvoidBottomPadding: true,
              body: FormKeyboardActions(
                keyboardActionsPlatform: KeyboardActionsPlatform.ALL, //optional
                keyboardBarColor: Colors.grey[200],
                nextFocus: true,
                actions: [
                  // KeyboardAction(
                  //   focusNode: _nodeText1,
                  // ),
                  // KeyboardAction(
                  //   focusNode: _nodeText2,
                  // ),
                  // KeyboardAction(
                  //   focusNode: _nodeText3,
                  // ),
                ],
                child: Stack(children: <Widget>[
                  // Container(
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage("assets/img/png/full-bg.png"),
                  //           fit: BoxFit.cover)),
                  // ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 250),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Final Data",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                FormInputWidget(
                                  label: "Other Comments",
                                  controller: comments,
                                  keyboardType: TextInputType.multiline,
                                  node: _nodeText1,
                                ),
                                // SizedBox(
                                //   height: 13.0,
                                // ),
                                // SizedBox(
                                //   height: 13.0,
                                // ),
                                errorWidget(),
                                successWidget(),
                                SizedBox(
                                  height: 4.0,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                ButtonWidget(
                                    text: "Submit",
                                    loadingState: _loading,
                                    onTap: () {
                                      print('object');
                                      validateInput();
                                    }),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )
          : Scaffold(
              resizeToAvoidBottomPadding: true,
              body: FormKeyboardActions(
                keyboardActionsPlatform: KeyboardActionsPlatform.ALL, //optional
                keyboardBarColor: Colors.grey[200],
                nextFocus: true,
                actions: [
                  // KeyboardAction(
                  //   focusNode: _nodeText1,
                  // ),
                  // KeyboardAction(
                  //   focusNode: _nodeText2,
                  // ),
                  // KeyboardAction(
                  //   focusNode: _nodeText3,
                  // ),
                ],
                child: Stack(children: <Widget>[
                  Container(
                    color: Colors.white70,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage("assets/img/png/full-bg.png"),
                    //         fit: BoxFit.cover)),
                  ),
                  ListView(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      padding:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 250),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Final Data",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                FormInputWidget(
                                  label: "Other Comments",
                                  controller: comments,
                                  keyboardType: TextInputType.multiline,
                                  node: _nodeText1,
                                ),
                                errorWidget(),
                                successWidget(),
                                SizedBox(
                                  height: 4.0,
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                ButtonWidget(
                                    text: "Submit",
                                    loadingState: _loading,
                                    onTap: () {
                                      setState(() {
                                        _loading = true;
                                      });
                                      validateInput();
                                    }),
                                SizedBox(
                                  height: 16.0,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ]),
                ]),
              ),
            );
    });
  }
}
