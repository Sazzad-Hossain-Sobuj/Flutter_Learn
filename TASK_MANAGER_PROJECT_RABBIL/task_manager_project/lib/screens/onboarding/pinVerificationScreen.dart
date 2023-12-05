import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../style/style.dart';


class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  'PIN Verfication',
                  style: Head1Text(darkBlue),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  'A 6 digit pin has been send your mobile number',
                  style: Head6Text(lightGrey),
                ),
                const SizedBox(
                  height: 10,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  pinTheme: AppOTPStyle(),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(seconds: 1),
                  enableActiveFill: true,

                  onCompleted: (v){
                  },
                  onChanged: (val){
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
