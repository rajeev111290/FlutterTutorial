import 'package:flutter/material.dart';
import 'package:flutter_intro/chapter3/utils/colors.dart';

const String POPPINS_FONT = 'Poppins';
const String NUNITOSANS_FONT = 'NunitoSans';

Widget textH1(String text, int maxLines) {
  return Text(
    text,
    maxLines: maxLines,
    style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        color: grey0,
        fontFamily: POPPINS_FONT,
        fontSize: 36.0),
  );
}

Widget textH2(String text, int maxLines) {
  return Text(
    text,
    maxLines: maxLines,
    style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        color: grey0,
        fontFamily: POPPINS_FONT,
        fontSize: 24.0),
  );
}

Widget textH3(String text, int maxLines) {
  return Text(
    text,
    maxLines: maxLines,
    style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: grey0,
        fontFamily: POPPINS_FONT,
        fontSize: 18.0),
  );
}

Widget textH4(String text, int maxLines) {
  return Text(
    text,
    maxLines: maxLines,
    style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: grey0,
        fontFamily: POPPINS_FONT,
        fontSize: 14.0),
  );
}

Widget textH5(String text, int maxLines) {
  return Text(
    text,
    maxLines: maxLines,
    style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: grey0,
        fontFamily: POPPINS_FONT,
        fontSize: 12.0),
  );
}

Widget textH6(String text, int maxLines) {
  return Text(
    text,
    maxLines: maxLines,
    style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: grey0,
        fontFamily: POPPINS_FONT,
        fontSize: 10.0),
  );
}

// TODO : Similarly text widget for specific style can be created here as per design requirements

