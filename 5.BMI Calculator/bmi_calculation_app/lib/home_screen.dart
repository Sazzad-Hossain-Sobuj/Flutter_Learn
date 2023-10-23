import 'dart:math';

import 'package:bmi_calculation_app/gender_widget.dart';
import 'package:bmi_calculation_app/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'age_weight_widget.dart';
import 'height_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  GenderWidget(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  HeightWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeightWidget(
                        onChange: (ageVal) {
                          _age = ageVal;
                        },
                        title: 'Age',
                        initValue: 30,
                        min: 0,
                        max: 100,
                      ),
                      AgeWeightWidget(
                        onChange: (weightVal) {
                          _weight = weightVal;
                        },
                        title: 'Weight(kg)',
                        initValue: 50,
                        min: 0,
                        max: 200,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 65),
                    child: SwipeableButtonView(
                      buttonColor: Colors.white,
                        isFinished: _isFinished,
                        onFinish: () async {
                          await Navigator.push(
                              context,
                              PageTransition(
                                  child: ScoreScreen(
                                      bmiScore: _bmiScore, age: _age),
                                  type: PageTransitionType.fade));
                          _isFinished = false;
                          setState(() {});
                        },
                        onWaitingProcess: () {
                          //calculate bmi here
                          calculationBmi();
                          Future.delayed(Duration(seconds: 1), () {
                            _isFinished = true;
                            setState(() {});
                          });
                        },
                        activeColor: Colors.pink,
                        buttonWidget: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: 'Calculate'),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void calculationBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
