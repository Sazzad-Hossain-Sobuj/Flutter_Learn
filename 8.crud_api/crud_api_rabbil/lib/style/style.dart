
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const red = Colors.red;
const green = Colors.green;
const white = Colors.white;
const black = Colors.black54;

SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle(){
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 2,
    mainAxisExtent: 250,
  );

}

InputDecoration AppInputDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: green,width: 1),
    ),
    filled: true,
    fillColor: white,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    border: const OutlineInputBorder(),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: white),
    ),
    labelText: label,

  );
}

DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: white,width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
    child: Padding(padding: EdgeInsets.only(left: 30, right: 30),
    child: child,),
  );

}


SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    'assets/background.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,

  );
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(0),
    elevation: 1,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );
}

Ink SuccessButtonChild (ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: green,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 40,
      alignment: Alignment.center,
      child: Text(ButtonText,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
    ),

  );

}


void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );

}
void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );

}