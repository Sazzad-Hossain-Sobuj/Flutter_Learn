import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<emailVerificationScreen> createState() => _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Email Address', style: Head1Text(darkBlue),),
                const SizedBox(height: 1,),
                Text('A 6 digit verification pin will send your your email address', style: Head6Text(lightGrey),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration('Email Address'),),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
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
