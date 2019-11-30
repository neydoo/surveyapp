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

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  // @override

  // animation for top
  // double _animationTopVertical = 0;
  // double _animationTopHorizontal = 0;

  // form loading state
  bool loading = false;
  Map userdata = {};

  // nodes for our inputs
  static FocusNode _nodeText1 = FocusNode();
  static FocusNode _nodeText2 = FocusNode();
  static FocusNode _nodeText3 = FocusNode();
  // controllers for our inputs
  static TextEditingController pname = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController play = TextEditingController();

  // used to validate the input of the form
  validateInput() {
    setState(() {
      _playError = "";
      _emailError = "";
      _nameError = "";
    });
    if (email.text.length < 1) {
      setState(() {
        _emailError = "Fill up email";
      });
      if (pname.text.length < 1) {
        setState(() {
          _nameError = "Fill up name";
        });
      }
      if (play.text.length < 1) {
        setState(() {
          _playError = "Fill up name of play";
        });
      }
      return false;
    }
    userdata = {
      "name": pname.text.trim(),
      "email": email.text.trim(),
      "play": play.text.trim()
    };
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Screen1(
          answers: userdata,
        ),
      ),
    );
  }

  Future loginUser() async {
    Map<String, dynamic> inputData = {
      "name": pname.text.trim(),
      "email": email.text.trim(),
      "play": play.text.trim()
    };
    // validation checks
    if (validateInput()) {
      try {
        // http.Response response = await http.post(
        //   API.login,
        //   body: json.encode(inputData),
        //   headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        // );

        // var decodedResponse = json.decode(response.body);
        // int statusCode = response.statusCode;

        // print(decodedResponse['response']);

        // save user details and token in shared preferences
        // await Authentication.storeToken(decodedResponse['response']);

        final _authenticationBloc =
            BlocProvider.of<AuthenticationBloc>(context);
        _authenticationBloc.dispatch(FetchAuthState());

        // redirect to dashboard
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e);
        // set error
        setState(() {
          _error = "An error occured";
        });
      }
    }
  }

// stores the error state
  String _error = "";
  String _emailError = "";
  String _nameError = "";
  String _playError = "";

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
    return Scaffold(
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
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
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
                          label: "Participant Email",
                          onChanged: (text) {
                            if (text.length >= 1) {
                              return setState(() {
                                _emailError = "";
                              });
                            }
                            return setState(() {
                              _emailError = "Fill up email";
                            });
                          },
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          node: _nodeText2,
                        ),
                        emailErrorWidget(),
                        SizedBox(
                          height: 13.0,
                        ),
                        FormInputWidget(
                          label: "Name of play",
                          onChanged: (text) {
                            if (text.length >= 1) {
                              return setState(() {
                                _nameError = "";
                              });
                            }
                            return setState(() {
                              _playError = "Fill up the name of the play";
                            });
                          },
                          controller: play,
                          keyboardType: TextInputType.text,
                          node: _nodeText3,
                        ),
                        playErrorWidget(),
                        SizedBox(
                          height: 13.0,
                        ),
                        errorWidget(),
                        SizedBox(
                          height: 4.0,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ButtonWidget(
                            text: "Next",
                            loadingState: loading,
                            onTap: () async {
                              await validateInput();
                            }),
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
    );
  }
}
