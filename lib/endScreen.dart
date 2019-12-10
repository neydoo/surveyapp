import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/authentication.dart';
import 'dart:async';
import 'package:surveyapp/models/user_data.dart';
import 'package:surveyapp/bloc/connection_bloc.dart';

class End extends StatefulWidget {
  @override
  _EndState createState() => _EndState();
}

StreamSubscription streamSubscription;

class _EndState extends State<End> {
  void initState() {
    super.initState();
  }

  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  var connectionBloc = ConnectionBloc();

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
                                top: MediaQuery.of(context).size.height * 0.15),
                            child: Text(
                              'Thank you for taking the survey',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.15),
                                child: ButtonWidget(
                                    danger: true,
                                    text: 'Exit',
                                    onTap: () => SystemNavigator.pop()),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.15),
                                child: ButtonWidget(
                                  text: 'New Survey',
                                  onTap: () async {
                                    // await Authentication.logout();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            User(),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
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
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.15),
                            child: Text(
                              'Thank you for taking the survey',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.15),
                                child: ButtonWidget(
                                    danger: true,
                                    text: 'Exit',
                                    onTap: () => SystemNavigator.pop()),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.15),
                                child: ButtonWidget(
                                  text: 'New Survey',
                                  onTap: () async {
                                    // await Authentication.logout();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            User(),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
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
