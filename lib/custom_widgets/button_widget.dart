import 'package:flutter/material.dart';
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:surveyapp/custom_widgets/verifi_tap.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final Function onTap;
  bool loadingState;
  bool danger;

  ButtonWidget(
      {Key key, @required this.text, @required this.onTap, this.loadingState = false, this.danger = false}) : super(key: key);

  @override
  _ButtonWidgetState createState() =>
      _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  Widget getLoadingState() {
    if (widget.loadingState) {
      return CircularProgressIndicator(
        valueColor: (!widget.danger) ? AlwaysStoppedAnimation<Color>(VerifiColors.blue) : AlwaysStoppedAnimation<Color>(VerifiColors.red)
      );
    }
    return VerifiTap(
      onTap: () => widget.onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 35),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: (!widget.danger) ? Color.fromRGBO(1, 103, 246, 0.38) : Color.fromRGBO(235, 12, 12, 0.15),
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ),
              )
            ],
            borderRadius: BorderRadius.circular(25),
            color: (widget.danger)? const Color(0xffEB0C0C) : const Color(0xff0167F6)),
        child: Center(
            child: Text(widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.07,
                  fontFamily: "Lato",
                ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[getLoadingState()],
    );
  }
}
