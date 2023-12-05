import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const red = Colors.red;
const green = Colors.teal;
const white = Colors.white;
const darkBlue = Colors.blueGrey;
const lightGrey = Colors.grey;
const lightBlack = Colors.black12;
const orange = Colors.orange;

TextStyle Head1Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );
}

TextStyle Head6Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

InputDecoration AppInputDecoration(label) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: green, width: 1),
    ),
    fillColor: white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: white, width: 0),
    ),
    border: const OutlineInputBorder(),
    labelText: label,
  );
}

SvgPicture ScreenBackground(context) {
  return SvgPicture.asset(
    'assets/images/background.svg',
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.cover,
  );
}

void SuccesToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: green,
      textColor: white,
      fontSize: 16.0);
}

void ErrorToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: red,
      textColor: white,
      fontSize: 16.0);
}

PinTheme AppOTPStyle() {
  return PinTheme(
      inactiveColor: lightBlack,
      inactiveFillColor: white,
      selectedColor: green,
      activeColor: white,
      selectedFillColor: green,
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(5),
      fieldHeight: 50,
      fieldWidth: 50,
      borderWidth: 0.5,
      activeFillColor: white
  );
}
