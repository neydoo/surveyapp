import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:surveyapp/config/svgs.dart';
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:surveyapp/custom_widgets/verifi_tap.dart';

class FormInputWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  bool password;
  bool money;
  Function onChanged;
  final FocusNode node;
  TextInputType keyboardType;

  FormInputWidget(
      {@required this.label,
      password = false,
      money = false,
      keyboardType = TextInputType.text,
      this.onChanged,
      @required this.controller,
      @required this.node}) {
    this.password = password;
    this.money = money;
    this.keyboardType = keyboardType;
  }
  @override
  _FormInputWidgetState createState() => _FormInputWidgetState();
}

class _FormInputWidgetState extends State<FormInputWidget> {
  bool _passwordVisible = false;

  Widget getInput() {
    if (widget.password) {
      return Stack(
        children: <Widget>[
          TextField(
            obscureText: (_passwordVisible) ? false : true,
            onChanged: (string) => widget.onChanged(string),
            controller: widget.controller,
            focusNode: widget.node,
            decoration: InputDecoration(
              filled: true,
              fillColor: VerifiColors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 11),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffE0E1E3), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1.0, color: Color(0xff68E781)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ],
      );
    }

    if (widget.money) {
      return Stack(
        children: <Widget>[
          TextField(
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            onChanged: (string) => widget.onChanged(string),
            controller: widget.controller,
            focusNode: widget.node,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            decoration: InputDecoration(
              filled: true,
              fillColor: VerifiColors.white,
              contentPadding:
                  EdgeInsets.only(left: 80, right: 11, top: 15, bottom: 15),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffE0E1E3), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1.0, color: Color(0xff68E781)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            top: 0,
            child: Container(
              width: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: VerifiColors.darkblue),
              padding: EdgeInsets.all(12),
              child: Text('NGN',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: VerifiColors.white)),
            ),
          )
        ],
      );
    }

    return TextField(
      controller: widget.controller,
      focusNode: widget.node,
      onChanged: (string) => widget.onChanged(string),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: VerifiColors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 11),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE0E1E3), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.0, color: Color(0xff68E781)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Lato",
            fontWeight: FontWeight.w600,
            color: VerifiColors.grey2,
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        getInput(),
      ],
    );
  }
}
