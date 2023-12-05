import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({Key? key}) : super(key: key);

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
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
                Text('Set password', style: Head1Text(darkBlue),),
                const SizedBox(height: 1,),
                Text('Minimum length 8 character', style: Head6Text(lightGrey),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration('Password'),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration('Confirm password'),),
                const SizedBox(height: 20,),SizedBox(
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
