import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({Key? key}) : super(key: key);

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
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
                Text('Join With Us', style: Head1Text(darkBlue),),
                const SizedBox(height: 1,),
                Text('Learn with Sazzad Hossain', style: Head6Text(lightGrey),),
                const SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration('Email'),),
                const SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration('First name'),),
                const SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration('Last name'),),
                const SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration('Mobile'),),
                const SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration('Password'),),
                const SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration('Confirm password'),),
                const SizedBox(height: 10,),
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
