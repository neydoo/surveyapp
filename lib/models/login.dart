import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:surveyapp/config/api.dart';
import 'package:surveyapp/homeScreen.dart';
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/custom_widgets/form_input_widget.dart';
import 'package:surveyapp/models/authentication.dart';
import 'package:surveyapp/bloc/bloc.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  final String email;
  Login({this.email = ""});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    email.text = widget.email;
    password.text = "";

    // animate the top
    Timer(Duration(milliseconds: 100), () {
      // setState(() {
      //   _animationTopVertical = 40;
      //   _animationTopHorizontal = 20;
      // });
    });
  }

  // animation for top
  // double _animationTopVertical = 0;
  // double _animationTopHorizontal = 0;

  // form loading state
  bool loading = false;

  // nodes for our inputs
  static FocusNode _nodeText1 = FocusNode();
  static FocusNode _nodeText2 = FocusNode();
  // controllers for our inputs
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();
  //Provide a Base URL

//Provide authentication, this will go as a Header in Request

  // used to validate the input of the form
  validateInput() {
    setState(() {
      _error = "";
      _phoneError = "";
    });
    if (email.text.length < 1) {
      setState(() {
        _phoneError = "Fill up your email";
      });
      if (password.text.length < 1) {
        setState(() {
          _error = "Fill up your password";
        });
      }
      return false;
    }
    if (password.text.length < 1) {
      setState(() {
        _error = "Fill up your password";
      });
      return false;
    }
    return true;
  }

  Future loginUser() async {
    Map<String, dynamic> inputData = {
      "email": email.text.trim(),
      "password": password.text.trim()
    };
    // validation checks
    if (validateInput()) {
      try {
        http.Response response = await http.post(
          API.login,
          body: json.encode(inputData),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        );

        var decodedResponse = json.decode(response.body);
        int statusCode = response.statusCode;

        // if not successful, confirm user is an employee without an account
        if (statusCode != 200) {
          setState(() {
            _error = decodedResponse['message'];
          });
          return;
        }
        // print(decodedResponse);
        // print(decodedResponse['payload']['token']);
        // save user details and token in shared preferences
        await Authentication.storeToken(decodedResponse['payload']['token']);

        final _authenticationBloc =
            BlocProvider.of<AuthenticationBloc>(context);
        _authenticationBloc.dispatch(FetchAuthState());

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
  }

// stores the error state
  String _error = "";
  String _phoneError = "";

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
  Widget phoneErrorWidget() {
    if (_phoneError.length > 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 2,
          ),
          Text(
            _phoneError,
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

  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomPadding: true,
          body: FormKeyboardActions(
            keyboardActionsPlatform: KeyboardActionsPlatform.ALL, //optional
            keyboardBarColor: Colors.grey[200],
            nextFocus: true,
            actions: [
              KeyboardAction(
                focusNode: _nodeText1,
              ),
              KeyboardAction(
                focusNode: _nodeText2,
              ),
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
                              "Login",
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
                              label: "Email",
                              onChanged: (text) {
                                if (text.length >= 1) {
                                  return setState(() {
                                    _phoneError = "";
                                  });
                                }
                                return setState(() {
                                  _phoneError = "Fill up your email";
                                });
                              },
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              node: _nodeText1,
                            ),
                            phoneErrorWidget(),
                            SizedBox(
                              height: 13.0,
                            ),
                            FormInputWidget(
                                label: "Password",
                                controller: password,
                                onChanged: (text) {
                                  if (text.length >= 1) {
                                    return setState(() {
                                      _error = "";
                                    });
                                  }
                                  return setState(() {
                                    _error = "Fill up your password";
                                  });
                                },
                                password: true,
                                node: _nodeText2),
                            errorWidget(),
                            SizedBox(
                              height: 4.0,
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            ButtonWidget(
                                text: "LOGIN",
                                loadingState: loading,
                                onTap: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  await loginUser();
                                  setState(() {
                                    loading = false;
                                  });
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
        ),
        onWillPop: () {
          return SystemNavigator.pop();
        });
  }
}
