import 'package:surveyapp/custom_widgets/verifi_tap.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/custom_widgets/button_widget.dart';
import 'package:surveyapp/models/screen4.dart';
import 'package:surveyapp/config/verifi_colors.dart';

// import '../questions.dart';

class Screen3 extends StatefulWidget {
  final Map screen2Answer;
  final TextEditingController pname;
  final TextEditingController email;

  const Screen3({Key key, this.screen2Answer, this.pname, this.email}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  validateInput() {
    setState(() {
      _error = "";
    });
    if (widget.screen2Answer["screen3"] == null) {
      setState(() {
        _error = "Select an option";
      });

      return false;
    }
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Screen4(
          screen3Answer: widget.screen2Answer, pname: widget.pname, email: widget.email
        ),
      ),
    );
  }

  String _error = "";

  bool smiley0 = false;
  bool smiley1 = false;
  bool smiley2 = false;
  bool smiley3 = false;
  bool smiley4 = false;
  bool smiley5 = false;
  bool smiley6 = false;
  bool smiley7 = false;
  bool smiley8 = false;
  bool smiley9 = false;

  Widget errorWidget() {
    if (_error.length > 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 4,
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
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          // padding: EdgeInsets.all(20),
                          // height: MediaQuery.of(context).size.height * 0.22,
                          child: Text(
                              'Would you recommend the show to another person?',
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
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley0 = true;
                                          smiley1 = false;
                                          smiley2 = false;
                                          smiley3 = false;
                                          smiley4 = false;
                                          smiley5 = false;
                                          smiley6 = false;
                                          smiley7 = false;
                                          smiley8 = false;
                                          smiley9 = false;
                                        });
                                        widget.screen2Answer['screen3'] = "0";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen2Answer['screen3'] ==
                                                    "0"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        margin: EdgeInsets.all(5),
                                        width:
                                            widget.screen2Answer['screen3'] ==
                                                    "0"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/zero.png"),
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
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley0 = false;
                                          smiley1 = true;
                                          smiley2 = false;
                                          smiley3 = false;
                                          smiley4 = false;
                                          smiley5 = false;
                                          smiley6 = false;
                                          smiley7 = false;
                                          smiley8 = false;
                                          smiley9 = false;
                                        });
                                        widget.screen2Answer['screen3'] = "1";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen2Answer['screen3'] ==
                                                    "1"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        margin: EdgeInsets.all(5),
                                        width:
                                            widget.screen2Answer['screen3'] ==
                                                    "1"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/one.png"),
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
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley0 = false;
                                          smiley1 = false;
                                          smiley2 = true;
                                          smiley3 = false;
                                          smiley4 = false;
                                          smiley5 = false;
                                          smiley6 = false;
                                          smiley7 = false;
                                          smiley8 = false;
                                          smiley9 = false;
                                        });
                                        widget.screen2Answer['screen3'] = "2";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen2Answer['screen3'] ==
                                                    "2"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        margin: EdgeInsets.all(5),
                                        width:
                                            widget.screen2Answer['screen3'] ==
                                                    "2"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/two.png"),
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
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley0 = false;
                                          smiley1 = false;
                                          smiley2 = false;
                                          smiley3 = true;
                                          smiley4 = false;
                                          smiley5 = false;
                                          smiley6 = false;
                                          smiley7 = false;
                                          smiley8 = false;
                                          smiley9 = false;
                                        });
                                        widget.screen2Answer['screen3'] = "3";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen2Answer['screen3'] ==
                                                    "3"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        margin: EdgeInsets.all(5),
                                        width:
                                            widget.screen2Answer['screen3'] ==
                                                    "3"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/three.png"),
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
                                    VerifiTap(
                                      onTap: () {
                                        setState(() {
                                          _error = "";
                                          smiley0 = false;
                                          smiley1 = false;
                                          smiley2 = false;
                                          smiley3 = false;
                                          smiley4 = true;
                                          smiley5 = false;
                                          smiley6 = false;
                                          smiley7 = false;
                                          smiley8 = false;
                                          smiley9 = false;
                                        });
                                        widget.screen2Answer['screen3'] = "4";
                                      },
                                      child: Container(
                                        height:
                                            widget.screen2Answer['screen3'] ==
                                                    "4"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        margin: EdgeInsets.all(5),
                                        width:
                                            widget.screen2Answer['screen3'] ==
                                                    "4"
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.120,
                                        decoration: BoxDecoration(
                                            // color: VerifiColors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/png/four.png"),
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
                                  ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VerifiTap(
                                    onTap: () {
                                      setState(() {
                                        _error = "";
                                        smiley0 = false;
                                        smiley1 = false;
                                        smiley2 = false;
                                        smiley3 = false;
                                        smiley4 = false;
                                        smiley5 = true;
                                        smiley6 = false;
                                        smiley7 = false;
                                        smiley8 = false;
                                        smiley9 = false;
                                      });
                                      widget.screen2Answer['screen3'] = "5";
                                    },
                                    child: Container(
                                      height: widget.screen2Answer['screen3'] ==
                                              "5"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      margin: EdgeInsets.all(5),
                                      width: widget.screen2Answer['screen3'] ==
                                              "5"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/five.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  VerifiTap(
                                    onTap: () {
                                      setState(() {
                                        _error = "";
                                        smiley0 = false;
                                        smiley1 = false;
                                        smiley2 = false;
                                        smiley3 = false;
                                        smiley4 = false;
                                        smiley5 = false;
                                        smiley6 = true;
                                        smiley7 = false;
                                        smiley8 = false;
                                        smiley9 = false;
                                      });
                                      widget.screen2Answer['screen3'] = "6";
                                    },
                                    child: Container(
                                      height: widget.screen2Answer['screen3'] ==
                                              "6"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      margin: EdgeInsets.all(5),
                                      width: widget.screen2Answer['screen3'] ==
                                              "6"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/six.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  VerifiTap(
                                    onTap: () {
                                      setState(() {
                                        _error = "";
                                        smiley0 = false;
                                        smiley1 = false;
                                        smiley2 = false;
                                        smiley3 = false;
                                        smiley4 = false;
                                        smiley5 = false;
                                        smiley6 = false;
                                        smiley7 = true;
                                        smiley8 = false;
                                        smiley9 = false;
                                      });
                                      widget.screen2Answer['screen3'] = "7";
                                    },
                                    child: Container(
                                      height: widget.screen2Answer['screen3'] ==
                                              "7"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      margin: EdgeInsets.all(5),
                                      width: widget.screen2Answer['screen3'] ==
                                              "7"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/seven.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  VerifiTap(
                                    onTap: () {
                                      setState(() {
                                        _error = "";
                                        smiley0 = false;
                                        smiley1 = false;
                                        smiley2 = false;
                                        smiley3 = false;
                                        smiley4 = false;
                                        smiley5 = false;
                                        smiley6 = false;
                                        smiley7 = false;
                                        smiley8 = true;
                                        smiley9 = false;
                                      });
                                      widget.screen2Answer['screen3'] = "8";
                                    },
                                    child: Container(
                                      height: widget.screen2Answer['screen3'] ==
                                              "8"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      margin: EdgeInsets.all(5),
                                      width: widget.screen2Answer['screen3'] ==
                                              "8"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/eight.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  VerifiTap(
                                    onTap: () {
                                      setState(() {
                                        _error = "";
                                        smiley0 = false;
                                        smiley1 = false;
                                        smiley2 = false;
                                        smiley3 = false;
                                        smiley4 = false;
                                        smiley5 = false;
                                        smiley6 = false;
                                        smiley7 = false;
                                        smiley8 = false;
                                        smiley9 = true;
                                      });
                                      widget.screen2Answer['screen3'] = "9";
                                    },
                                    child: Container(
                                      height: widget.screen2Answer['screen3'] ==
                                              "9"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      margin: EdgeInsets.all(5),
                                      width: widget.screen2Answer['screen3'] ==
                                              "9"
                                          ? MediaQuery.of(context).size.width *
                                              0.150
                                          : MediaQuery.of(context).size.width *
                                              0.120,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/nine.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  // VerifiTap(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       _error = "";
                                  //     });
                                  //     widget.screen2Answer['screen3'] = "10";
                                  //   },
                                  //   child: Container(
                                  //     height:
                                  //         MediaQuery.of(context).size.height *
                                  //             0.07,
                                  //     margin: EdgeInsets.all(5),
                                  //     width: MediaQuery.of(context).size.width *
                                  //         0.120,
                                  //     decoration: BoxDecoration(
                                  //         // color: VerifiColors.blue,
                                  //         image: DecorationImage(
                                  //           image: AssetImage(
                                  //               "assets/img/png/ten.png"),
                                  //           fit: BoxFit.cover,
                                  //         ),
                                  //         boxShadow: [
                                  //           BoxShadow(
                                  //             color:
                                  //                 Color.fromRGBO(0, 0, 0, 0.1),
                                  //             blurRadius: 19.5,
                                  //             offset: Offset(0, 6),
                                  //           )
                                  //         ],
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(5))),
                                  //   ),
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                        errorWidget(),
                        Container(
                          margin: EdgeInsets.all(50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                // margin: EdgeInsets.all(10),
                                child: ButtonWidget(
                                  text: 'Next',
                                  onTap: () => validateInput(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                  child: ListView(children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              'Would you recommend the show to another person?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black
                              )
                              ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 50, top: 20),
                          child: Row(
                            children: [
                              Row(children: <Widget>[
                                VerifiTap(
                                  onTap: () {
                                    setState(() {
                                      _error = "";
                                      smiley0 = true;
                                      smiley1 = false;
                                      smiley2 = false;
                                      smiley3 = false;
                                      smiley4 = false;
                                      smiley5 = false;
                                      smiley6 = false;
                                      smiley7 = false;
                                      smiley8 = false;
                                      smiley9 = false;
                                    });
                                    widget.screen2Answer['screen3'] = "0";
                                  },
                                  child: Container(
                                    height: widget.screen2Answer['screen3'] ==
                                            "0"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    margin: EdgeInsets.all(5),
                                    width: widget.screen2Answer['screen3'] ==
                                            "0"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/zero.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 19.5,
                                            offset: Offset(0, 6),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                ),
                                VerifiTap(
                                  onTap: () {
                                    setState(() {
                                      _error = "";
                                      smiley0 = false;
                                      smiley1 = true;
                                      smiley2 = false;
                                      smiley3 = false;
                                      smiley4 = false;
                                      smiley5 = false;
                                      smiley6 = false;
                                      smiley7 = false;
                                      smiley8 = false;
                                      smiley9 = false;
                                    });
                                    widget.screen2Answer['screen3'] = "1";
                                  },
                                  child: Container(
                                    height: widget.screen2Answer['screen3'] ==
                                            "1"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    margin: EdgeInsets.all(5),
                                    width: widget.screen2Answer['screen3'] ==
                                            "1"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/one.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 19.5,
                                            offset: Offset(0, 6),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                ),
                                VerifiTap(
                                  onTap: () {
                                    setState(() {
                                      _error = "";
                                      smiley0 = false;
                                      smiley1 = false;
                                      smiley2 = true;
                                      smiley3 = false;
                                      smiley4 = false;
                                      smiley5 = false;
                                      smiley6 = false;
                                      smiley7 = false;
                                      smiley8 = false;
                                      smiley9 = false;
                                    });
                                    widget.screen2Answer['screen3'] = "2";
                                  },
                                  child: Container(
                                    height: widget.screen2Answer['screen3'] ==
                                            "2"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    margin: EdgeInsets.all(5),
                                    width: widget.screen2Answer['screen3'] ==
                                            "2"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/two.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 19.5,
                                            offset: Offset(0, 6),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                ),
                                VerifiTap(
                                  onTap: () {
                                    setState(() {
                                      _error = "";
                                      smiley0 = false;
                                      smiley1 = false;
                                      smiley2 = false;
                                      smiley3 = true;
                                      smiley4 = false;
                                      smiley5 = false;
                                      smiley6 = false;
                                      smiley7 = false;
                                      smiley8 = false;
                                      smiley9 = false;
                                    });
                                    widget.screen2Answer['screen3'] = "3";
                                  },
                                  child: Container(
                                    height: widget.screen2Answer['screen3'] ==
                                            "3"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    margin: EdgeInsets.all(5),
                                    width: widget.screen2Answer['screen3'] ==
                                            "3"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/three.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 19.5,
                                            offset: Offset(0, 6),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                ),
                                VerifiTap(
                                  onTap: () {
                                    setState(() {
                                      _error = "";
                                      smiley0 = false;
                                      smiley1 = false;
                                      smiley2 = false;
                                      smiley3 = false;
                                      smiley4 = true;
                                      smiley5 = false;
                                      smiley6 = false;
                                      smiley7 = false;
                                      smiley8 = false;
                                      smiley9 = false;
                                    });
                                    widget.screen2Answer['screen3'] = "4";
                                  },
                                  child: Container(
                                    height: widget.screen2Answer['screen3'] ==
                                            "4"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    margin: EdgeInsets.all(5),
                                    width: widget.screen2Answer['screen3'] ==
                                            "4"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/four.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 19.5,
                                            offset: Offset(0, 6),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                ),
                                VerifiTap(
                                  onTap: () {
                                    setState(() {
                                      _error = "";
                                      smiley0 = false;
                                      smiley1 = false;
                                      smiley2 = false;
                                      smiley3 = false;
                                      smiley4 = false;
                                      smiley5 = true;
                                      smiley6 = false;
                                      smiley7 = false;
                                      smiley8 = false;
                                      smiley9 = false;
                                    });
                                    widget.screen2Answer['screen3'] = "5";
                                  },
                                  child: Container(
                                    height: widget.screen2Answer['screen3'] ==
                                            "5"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    margin: EdgeInsets.all(5),
                                    width: widget.screen2Answer['screen3'] ==
                                            "5"
                                        ? MediaQuery.of(context).size.width *
                                            0.085
                                        : MediaQuery.of(context).size.width *
                                            0.070,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/five.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 19.5,
                                            offset: Offset(0, 6),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                ),
                              ]),
                              Row(
                                children: [
                                  VerifiTap(
                                    onTap: () {
                                      setState(() {
                                        _error = "";
                                        smiley0 = false;
                                        smiley1 = false;
                                        smiley2 = false;
                                        smiley3 = false;
                                        smiley4 = false;
                                        smiley5 = false;
                                        smiley6 = true;
                                        smiley7 = false;
                                        smiley8 = false;
                                        smiley9 = false;
                                      });
                                      widget.screen2Answer['screen3'] = "6";
                                    },
                                    child: Container(
                                      height: widget.screen2Answer['screen3'] ==
                                              "6"
                                          ? MediaQuery.of(context).size.width *
                                              0.085
                                          : MediaQuery.of(context).size.width *
                                              0.070,
                                      margin: EdgeInsets.all(5),
                                      width: widget.screen2Answer['screen3'] ==
                                              "6"
                                          ? MediaQuery.of(context).size.width *
                                              0.085
                                          : MediaQuery.of(context).size.width *
                                              0.070,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/six.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  VerifiTap(
                                    onTap: () {
                                      setState(() {
                                        _error = "";
                                        smiley0 = false;
                                        smiley1 = false;
                                        smiley2 = false;
                                        smiley3 = false;
                                        smiley4 = false;
                                        smiley5 = false;
                                        smiley6 = false;
                                        smiley7 = true;
                                        smiley8 = false;
                                        smiley9 = false;
                                      });
                                      widget.screen2Answer['screen3'] = "7";
                                    },
                                    child: Container(
                                      height: widget.screen2Answer['screen3'] ==
                                              "7"
                                          ? MediaQuery.of(context).size.width *
                                              0.085
                                          : MediaQuery.of(context).size.width *
                                              0.070,
                                      margin: EdgeInsets.all(5),
                                      width: widget.screen2Answer['screen3'] ==
                                              "7"
                                          ? MediaQuery.of(context).size.width *
                                              0.085
                                          : MediaQuery.of(context).size.width *
                                              0.070,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/seven.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  VerifiTap(
                                    onTap: () {
                                      setState(() {
                                        _error = "";
                                        smiley0 = false;
                                        smiley1 = false;
                                        smiley2 = false;
                                        smiley3 = false;
                                        smiley4 = false;
                                        smiley5 = false;
                                        smiley6 = false;
                                        smiley7 = false;
                                        smiley8 = true;
                                        smiley9 = false;
                                      });
                                      widget.screen2Answer['screen3'] = "8";
                                    },
                                    child: Container(
                                      height: widget.screen2Answer['screen3'] ==
                                              "8"
                                          ? MediaQuery.of(context).size.width *
                                              0.085
                                          : MediaQuery.of(context).size.width *
                                              0.070,
                                      margin: EdgeInsets.all(5),
                                      width: widget.screen2Answer['screen3'] ==
                                              "8"
                                          ? MediaQuery.of(context).size.width *
                                              0.085
                                          : MediaQuery.of(context).size.width *
                                              0.070,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/eight.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  VerifiTap(
                                    onTap: () {
                                      setState(() {
                                        _error = "";
                                        smiley0 = false;
                                        smiley1 = false;
                                        smiley2 = false;
                                        smiley3 = false;
                                        smiley4 = false;
                                        smiley5 = false;
                                        smiley6 = false;
                                        smiley7 = false;
                                        smiley8 = false;
                                        smiley9 = true;
                                      });
                                      widget.screen2Answer['screen3'] = "9";
                                    },
                                    child: Container(
                                      height: widget.screen2Answer['screen3'] ==
                                              "9"
                                          ? MediaQuery.of(context).size.width *
                                              0.085
                                          : MediaQuery.of(context).size.width *
                                              0.070,
                                      margin: EdgeInsets.all(5),
                                      width: widget.screen2Answer['screen3'] ==
                                              "9"
                                          ? MediaQuery.of(context).size.width *
                                              0.085
                                          : MediaQuery.of(context).size.width *
                                              0.070,
                                      decoration: BoxDecoration(
                                          // color: VerifiColors.blue,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/png/nine.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 19.5,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                  // VerifiTap(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       _error = "";
                                  //     });
                                  //     widget.screen2Answer['screen3'] = "10";
                                  //   },
                                  //   child: Container(
                                  //     height: MediaQuery.of(context).size.height *
                                  //       0.145,
                                  //   margin: EdgeInsets.all(5),
                                  //   width: MediaQuery.of(context).size.width *
                                  //       0.070,
                                  //     decoration: BoxDecoration(
                                  //         // color: VerifiColors.blue,
                                  //         image: DecorationImage(
                                  //           image: AssetImage(
                                  //               "assets/img/png/ten.png"),
                                  //           fit: BoxFit.cover,
                                  //         ),
                                  //         boxShadow: [
                                  //           BoxShadow(
                                  //             color:
                                  //                 Color.fromRGBO(0, 0, 0, 0.1),
                                  //             blurRadius: 19.5,
                                  //             offset: Offset(0, 6),
                                  //           )
                                  //         ],
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(5))),
                                  //   ),
                                  // )
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
                          margin: EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                // margin: EdgeInsets.all(10),
                                child: ButtonWidget(
                                  text: 'Next',
                                  onTap: () => validateInput(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            );
    });
  }
}
