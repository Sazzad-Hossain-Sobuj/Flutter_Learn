import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI SCORE'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(10),
          child: Card(
            shape: RoundedRectangleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Score',
                  style: TextStyle(fontSize: 30, color: Colors.pink),
                ),
                SizedBox(height: 20,),
                PrettyGauge(
                  gaugeSize: 200,
                  minValue: 0,
                  maxValue: 40,
                  segments: [
                    GaugeSegment('UnderWeight', 18.5, Colors.red),
                    GaugeSegment('Normal', 6.4, Colors.green),
                    GaugeSegment('OverWeight', 5, Colors.orange),
                    GaugeSegment('Obese', 10.1, Colors.pink),
                  ],
                  valueWidget: Text(bmiScore.toStringAsFixed(1),
                    style: TextStyle(fontSize: 30),
                  ),
                  currentValue: bmiScore.toDouble(),
                  needleColor: Colors.black,
                ),
                SizedBox(height: 10,),
                Text(bmiStatus!, style: TextStyle(fontSize: 20, color: bmiStatusColor!),),
                SizedBox(height: 5,),
                Text(bmiInterpretation!, style: TextStyle(fontSize: 20, color: bmiStatusColor!),),
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text('Re-Calculate')),
                    SizedBox(width: 20,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        onPressed: (){
                          Share.share('your BMI is ${bmiScore.toStringAsFixed(1)} at age $age');
                        },
                        child: Text('Share')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void setBmiInterpretation(){
    if(bmiScore > 30){
      bmiStatus = 'Obese';
      bmiInterpretation = 'Plz work hard to reduce weight';
      bmiStatusColor = Colors.pink;
    }
    else if (bmiScore >= 25){
      bmiStatus = 'Overweight';
      bmiInterpretation = 'Do regular exercises and reduce weight';
      bmiStatusColor = Colors.amber;
    }
    else if (bmiScore >= 18.5){
      bmiStatus = 'Normal';
      bmiInterpretation = "Hey! Enjoy your life. You're fit";
      bmiStatusColor = Colors.green;
    }
    else if (bmiScore < 18.5){
      bmiStatus = 'Underweight';
      bmiInterpretation = "Plz eat properly and try to increase your weight";
      bmiStatusColor = Colors.red;
    }
  }
}
