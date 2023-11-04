import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:neumorphism_calculator/style.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operaton = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick (value){
    if(value == 'AC'){
      input = '';
      output = '';
    }
    else if(value == '<'){
      if(input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    }
    else if (value == '='){
      if(input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('X', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finaVal = expression.evaluate(EvaluationType.REAL, cm);
        output = finaVal.toString();
        if(output.endsWith('.0')){
          output = output.substring(0, output.length -2);
        }

        input = output;
        hideInput = true;
      }
    }
    else {
      input = input + value;
      hideInput = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hideInput? '' : input,
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  output,
                  style: TextStyle(fontSize: outputSize, color: Colors.white.withOpacity(0.7)),
                ),
                SizedBox(height: 20,),
              ],
            ),
          )),
          Row(
            children: [
              button(text: 'AC'),
              button(text: '<'),
              button(text: '+/-'),
              button(text: '/', textColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(text: 'X', textColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(text: '-', textColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(text: '+', textColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: '%'),
              button(text: '0'),
              button(text: '.'),
              button(text: '=', textColor: orangeColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, textColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(22),
              primary: buttonBgColor),
          onPressed: () {
            onButtonClick(text);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          )),
    ));
  }
}
