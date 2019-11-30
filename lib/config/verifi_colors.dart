import 'package:flutter/material.dart';

class VerifiColors {
  static Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  static MaterialColor white = MaterialColor(0xffFFFFFF, color);
  static MaterialColor black = MaterialColor(0xff0B0A22, color);
  static MaterialColor darkblue = MaterialColor(0xff0F0D55, color);
  static MaterialColor green = MaterialColor(0xff68E781, color);
  static MaterialColor grey = MaterialColor(0xffE0E1E3, color);
  static MaterialColor blue = MaterialColor(0xff0167F6, color);
  static MaterialColor red = MaterialColor(0xffEB0C0C, color);
  static MaterialColor grey2 = MaterialColor(0xff9594B2, color);
  static MaterialColor newgrey = MaterialColor(0xff4E4E61, color);
  static MaterialColor backgroundColor = MaterialColor(0xffEFF2F8, color);
  static MaterialColor textColor = MaterialColor(0xff40404F, color);
  static MaterialColor defaultCheckboxColor = MaterialColor(0xffC4C4C4, color);
  static Color shadow = Color.fromRGBO(0, 0, 0, 0.22);
}
