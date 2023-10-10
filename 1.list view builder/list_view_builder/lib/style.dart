import 'package:flutter/material.dart';

InputDecoration AppStyle(label) {
  return InputDecoration(
    contentPadding: EdgeInsets.all(10),
    fillColor: Colors.teal,
    filled: true,
    border: OutlineInputBorder(),
    labelText: label,
    labelStyle: TextStyle(color: Colors.white),

  );
}

TextStyle HeadStyle(){
  return TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold
  );
}
ButtonStyle AddButton(){
  return ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )
  );

}