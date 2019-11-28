import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        // margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.145,
              decoration: BoxDecoration(
                  // color: VerifiColors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/img/png/emoji_1.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 19.5,
                      offset: Offset(0, 6),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            Container(
              height: 52,
              margin: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.145,
              decoration: BoxDecoration(
                  // color: VerifiColors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/img/png/emoji_2.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 19.5,
                      offset: Offset(0, 6),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            Container(
              height: 52,
              margin: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.145,
              decoration: BoxDecoration(
                  // color: VerifiColors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/img/png/emoji_3.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 19.5,
                      offset: Offset(0, 6),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            Container(
              height: 52,
              margin: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.145,
              decoration: BoxDecoration(
                  // color: VerifiColors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/img/png/emoji_4.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 19.5,
                      offset: Offset(0, 6),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            Container(
              height: 52,
              margin: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.145,
              decoration: BoxDecoration(
                  // color: VerifiColors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/img/png/emoji_5.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 19.5,
                      offset: Offset(0, 6),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            // ])
          ],
        )
        // ],)
        );
  }
}
