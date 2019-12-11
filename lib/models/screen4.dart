import 'package:surveyapp/custom_widgets/verifi_tap.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/screen5.dart';
import 'package:surveyapp/config/verifi_colors.dart';

// import '../questions.dart';

class Screen4 extends StatefulWidget {
  final Map screen3Answer;
  final TextEditingController email;
  final TextEditingController pname;

  const Screen4({Key key, this.screen3Answer, this.pname, this.email}) : super(key: key);

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  validateInput() {
    setState(() {
      _error = "";
    });
    if (widget.screen3Answer["screen4"] == null) {
      setState(() {
        _error = "Select an option";
      });

      return false;
    }
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Screen5(
          screen4Answer: widget.screen3Answer, pname: widget.pname, email: widget.email
        ),
      ),
    );
  }

  String _error = "";
  bool smiley1 = false;
  bool smiley2 = false;
  bool smiley3 = false;

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
                fontSize: 14,
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
          ? MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text('Survey App'),
                ),
                body: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            child: Column(
                              children: <Widget>[
                                Column(children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.25,
                                    child: Text(
                                        'Would you have been willing to pay N100 for the show? ',
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
                                    // padding: EdgeInsets.all(20),
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
                                                });
                                                widget.screen3Answer[
                                                    'screen4'] = '1';
                                              },
                                              child: Container(
                                                height: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '1'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.240
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.140,
                                                width: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '1'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.240
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.140,
                                                // margin:
                                                // EdgeInsets.only(left: 20),
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                              ),
                                            ),
                                            Text('No',
                                                style: TextStyle(
                                                    color: Colors.black87))
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
                                                });
                                                widget.screen3Answer[
                                                    'screen4'] = '2';
                                              },
                                              child: Container(
                                                height: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '2'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.240
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.140,
                                                width: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '2'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.245
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                              ),
                                            ),
                                            Text('Maybe',
                                                style: TextStyle(
                                                    color: Colors.black87))
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
                                                });
                                                widget.screen3Answer[
                                                    'screen4'] = '3';
                                              },
                                              child: Container(
                                                height: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '3'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.25
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.148,
                                                width: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '3'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.25
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.148,
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                              ),
                                            ),
                                            Text('Yes',
                                                style: TextStyle(
                                                    color: Colors.black87))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                  ),
                                  errorWidget(),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: ButtonWidget(
                                            danger: true,
                                            text: 'Back',
                                            onTap: () => Navigator.pop(context),
                                          ),
                                        ),
                                        Container(
                                          child: ButtonWidget(
                                            text: 'Next',
                                            onTap: () => validateInput(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
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
                      Column(
                        children: [
                          Container(
                            child: Column(
                              children: <Widget>[
                                Column(children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.432,
                                    child: Text(
                                        'Would you have been willing to pay N100 for the show? ',
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
                                    // padding: EdgeInsets.all(20),
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
                                                });
                                                widget.screen3Answer[
                                                    'screen4'] = '1';
                                              },
                                              child: Container(
                                                height: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '1'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.178
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.120,
                                                width: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '1'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.178
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.120,
                                                // margin: EdgeInsets.only(left: 100),
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                              ),
                                            ),
                                            Text(
                                              'No',
                                              style: TextStyle(
                                                  color: Colors.black87),
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
                                                });
                                                widget.screen3Answer[
                                                    'screen4'] = '2';
                                              },
                                              child: Container(
                                                height: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '2'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.178
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.120,
                                                width: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '2'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.178
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.120,
                                                // margin: EdgeInsets.only(left: 100),
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                              ),
                                            ),
                                            Text(
                                              'Maybe',
                                              style: TextStyle(
                                                  color: Colors.black87),
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
                                                });
                                                widget.screen3Answer[
                                                    'screen4'] = '3';
                                              },
                                              child: Container(
                                                height: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '3'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.177
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.124,
                                                width: widget.screen3Answer[
                                                            'screen4'] ==
                                                        '3'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.177
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.124,
                                                // margin: EdgeInsets.only(left: 100),
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                              ),
                                            ),
                                            // ])

                                            Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.black87),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                  ),
                                  errorWidget(),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: ButtonWidget(
                                            danger: true,
                                            text: 'Back',
                                            onTap: () => Navigator.pop(context),
                                          ),
                                        ),
                                        Container(
                                          child: ButtonWidget(
                                            text: 'Next',
                                            onTap: () => validateInput(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
