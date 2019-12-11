import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surveyapp/homeScreen.dart';
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/custom_widgets/form_input_widget.dart';
import 'package:surveyapp/bloc/bloc.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/models/screen1.dart';
import 'package:location/location.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  void initState() {
    super.initState();

    // location.onLocationChanged().listen((value) {
    //   setState(() {
    //     userLocation = value;
    //   });
    // });
  }

  var location = new Location();

  Map userLocation;
  bool loading = false;
  Map userdata = {};

  // nodes for our inputs
  static FocusNode _nodeText1 = FocusNode();
  static FocusNode _nodeText2 = FocusNode();
  // controllers for our inputs
  static TextEditingController pname = TextEditingController();
  static TextEditingController email = TextEditingController();

  // used to validate the input of the form
  getLocation() {
    setState(() {
      _successloading = true;
    });

    location.onLocationChanged().listen((value) {
      print(value);
      setState(() {
        _success = "success!!\n latitude: " +
            value['latitude'].toString() +
            "\n longtitude: " +
            value["longitude"].toString();
        _successloading = false;
      });
    });
  }

  validateInput() {
    setState(() {
      _emailError = "";
      _nameError = "";
      loading = true;
    });

    if (email.text.length < 11) {
      setState(() {
        _emailError = "Fill up phone";
      });
      if (pname.text.length < 1) {
        setState(() {
          _nameError = "Fill up name";
        });
      }

      setState(() {
        loading = false;
      });
      return false;
    }

    userdata = {
      "name": pname.text.trim(),
      "phone": email.text.trim(),
      "sex": sex
    };

    setState(() {
      loading = false;
    });

    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            Screen1(answers: userdata, pname: pname, email: email),
      ),
    );
  }

// stores the error state
  String _error = "";
  String _success = "";
  String _emailError = "";
  String _nameError = "";
  String sex = "Male";
  bool _successloading = false;

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

  Widget successWidget() {
    if (_success.length > 0) {
      return Row(
        children: <Widget>[
          SizedBox(
            height: 3,
          ),
          Text(
            _success,
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
                color: VerifiColors.green,
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

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? WillPopScope(
              child: Scaffold(
                resizeToAvoidBottomPadding: true,
                body: FormKeyboardActions(
                  keyboardActionsPlatform:
                      KeyboardActionsPlatform.ALL, //optional
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
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/img/png/full-bg.png"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 30),
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
                                    "User Data",
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
                                    label: "Participant Name",
                                    onChanged: (text) {
                                      if (text.length >= 1) {
                                        return setState(() {
                                          _nameError = "";
                                        });
                                      }
                                      return setState(() {
                                        _nameError = "Fill up name";
                                      });
                                    },
                                    controller: pname,
                                    keyboardType: TextInputType.text,
                                    node: _nodeText1,
                                  ),
                                  nameErrorWidget(),
                                  SizedBox(
                                    height: 13.0,
                                  ),
                                  FormInputWidget(
                                    label: "Participant Phone Number",
                                    onChanged: (text) {
                                      if (text.length >= 11) {
                                        return setState(() {
                                          _emailError = "";
                                        });
                                      }
                                      return setState(() {
                                        _emailError = "Fill up phonenumber";
                                      });
                                    },
                                    controller: email,
                                    keyboardType: TextInputType.number,
                                    node: _nodeText2,
                                  ),
                                  emailErrorWidget(),
                                  SizedBox(
                                    height: 13.0,
                                  ),
                                  DropdownButton<String>(
                                    hint: Text("Select Sex"),
                                    value: sex,
                                    items: <String>[
                                      'Male',
                                      'Female',
                                    ].map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String val) {
                                      sex = val;
                                      setState(() {
                                        sex = val;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 13.0,
                                  ),
                                  errorWidget(),
                                  successWidget(),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  SizedBox(
                                    height: 26.0,
                                  ),
                                  Row(children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: ButtonWidget(
                                          text: "Get Location",
                                          loadingState: _successloading,
                                          danger: true,
                                          onTap: () async {
                                            await getLocation();
                                          }),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: ButtonWidget(
                                          text: "Next",
                                          loadingState: loading,
                                          onTap: () async {
                                            await validateInput();
                                          }),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onWillPop: () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
                );
              })
          : WillPopScope(
              child: Scaffold(
                resizeToAvoidBottomPadding: true,
                body: FormKeyboardActions(
                  keyboardActionsPlatform:
                      KeyboardActionsPlatform.ALL, //optional
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
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/png/full-bg.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      ListView(children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 30),
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
                                    "User Data",
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
                                    label: "Participant Name",
                                    onChanged: (text) {
                                      if (text.length >= 1) {
                                        return setState(() {
                                          _nameError = "";
                                        });
                                      }
                                      return setState(() {
                                        _nameError = "Fill up name";
                                      });
                                    },
                                    controller: pname,
                                    keyboardType: TextInputType.text,
                                    node: _nodeText1,
                                  ),
                                  nameErrorWidget(),
                                  SizedBox(
                                    height: 13.0,
                                  ),
                                  FormInputWidget(
                                    label: "Participant Phone Number",
                                    onChanged: (text) {
                                      if (text.length >= 11) {
                                        return setState(() {
                                          _emailError = "";
                                        });
                                      }
                                      return setState(() {
                                        _emailError = "Fill up Phonenumber";
                                      });
                                    },
                                    controller: email,
                                    keyboardType: TextInputType.number,
                                    node: _nodeText2,
                                  ),
                                  emailErrorWidget(),
                                  SizedBox(
                                    height: 13.0,
                                  ),
                                  DropdownButton<String>(
                                    hint: Text("Select Sex"),
                                    value: sex,
                                    items: <String>[
                                      'Male',
                                      'Female',
                                    ].map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String val) {
                                      sex = val;
                                      setState(() {
                                        sex = val;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  errorWidget(),
                                  successWidget(),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(left: 180),
                                          child: ButtonWidget(
                                              text: "Get Location",
                                              loadingState: _successloading,
                                              danger: true,
                                              onTap: () async {
                                                getLocation();
                                              }),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: ButtonWidget(
                                              text: "Next",
                                              loadingState: loading,
                                              onTap: () async {
                                                await validateInput();
                                              }),
                                        )
                                      ]),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              onWillPop: () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
                );
              });
    });
  }
}
