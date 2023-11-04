<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen()
    );
  }
}


=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen()
    );
  }
}


>>>>>>> 8b1cafae7d9ed49e46af0eb48d2f9448ec042bfe
