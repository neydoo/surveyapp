import 'package:flutter/material.dart';
import 'package:surveyapp/homeScreen.dart';
import 'package:surveyapp/models/screen4.dart';

// import '../questions.dart';

class Screen5 extends StatefulWidget {
  final Map screen4Answer;

  const Screen5({Key key, this.screen4Answer}) : super(key: key);
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    child: Column(
                      children: <Widget>[
                        Column(children: [
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
                                  ))),
                          Container(
                              width: double.infinity,
                              // margin: EdgeInsets.all(50),
                              padding: EdgeInsets.all(20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width *
                                        0.145,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/emoji_1.png"),
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
                                  Container(
                                    height: 52,
                                    margin: EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width *
                                        0.145,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/emoji_2.png"),
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
                                  Container(
                                    height: 52,
                                    margin: EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width *
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
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 19.5,
                                            offset: Offset(0, 6),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                  Container(
                                    height: 52,
                                    margin: EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width *
                                        0.145,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/emoji_4.png"),
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
                                  Container(
                                    height: 52,
                                    margin: EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width *
                                        0.145,
                                    decoration: BoxDecoration(
                                        // color: VerifiColors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/png/emoji_5.png"),
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
                                  // ])
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.all(50),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(5),
                                    child: RaisedButton(
                                      color: Colors.redAccent,
                                      child: Text('previous question'),
                                      onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Screen4())),
                                    )),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: RaisedButton(
                                    color: Colors.greenAccent,
                                    child: Text('next question'),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Home())),
                                  ),
                                ),
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
  }
}
