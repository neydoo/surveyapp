import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/homeScreen.dart';

// import '../questions.dart';

class Screen5 extends StatefulWidget {
  final Map screen4Answer;

  const Screen5({Key key, this.screen4Answer}) : super(key: key);
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  bool answerSelected = false;

  Map answers = {};
  // Future loginUser() async {
  //   Map<String, dynamic> inputData = {
  //     "name": name.text.trim(),
  //     "email": email.text.trim(),
  //     "play": play.text.trim()
  //   };
  //   // validation checks
  //   if (validateInput()) {
  //     try {
  //       http.Response response = await http.post(
  //         API.login,
  //         body: json.encode(inputData),
  //         headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  //       );

  //       var decodedResponse = json.decode(response.body);
  //       int statusCode = response.statusCode;

  //       // if not successful, confirm user is an employee without an account
  //       if (statusCode != 200) {
  //         Map<String, dynamic> inputData = {"email": email.text.trim()};
  //         http.Response validateResponse = await http.post(
  //           API.validate,
  //           body: json.encode(inputData),
  //           headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  //         );

  //         // set error
  //         setState(() {
  //           _error = decodedResponse['response']['message'];
  //         });
  //         return;
  //       }

  //       print(decodedResponse['response']);

  //       // save user details and token in shared preferences
  //       await Authentication.storeToken(decodedResponse['response']);

  //       final _authenticationBloc =
  //           BlocProvider.of<AuthenticationBloc>(context);
  //       _authenticationBloc.dispatch(FetchAuthState());

  //       // redirect to dashboard
  //       Navigator.of(context).pushReplacement(
  //           new MaterialPageRoute(builder: (context) => Home()));
  //     } catch (e) {
  //       print(e);
  //       // set error
  //       setState(() {
  //         _error = "An error occured";
  //       });
  //     }
  //   }
  // }

// stores the error state
  // String _error = "";
  // String _emailError = "";
  // String _nameError = "";
  // String _playError = "";

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
                                answerSelected = true;
                              });
                              widget.screen4Answer['screen5'] = 'one';
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
                                answerSelected = true;
                              });
                              widget.screen4Answer['screen5'] = 'two';
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
                                answerSelected = true;
                              });
                              widget.screen4Answer['screen5'] = 'three';
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
                                answerSelected = true;
                              });
                              widget.screen4Answer['screen5'] = 'four';
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
                                answerSelected = true;
                              });
                              widget.screen4Answer['screen5'] = 'five';
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
                    Container(
                      margin: EdgeInsets.all(50),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: ButtonWidget(
                              danger: true,
                              text: 'Back',
                              onTap: () => Navigator.pop(context),
                            ),
                          ),
                          answerSelected
                              ? Container(
                                  margin: EdgeInsets.all(5),
                                  child: ButtonWidget(
                                    text: 'Submit',
                                    onTap: () {
                                      print(widget.screen4Answer);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Home(),
                                      ),
                                    );
                                    }
                                  ),
                                )
                              : Container(),
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
