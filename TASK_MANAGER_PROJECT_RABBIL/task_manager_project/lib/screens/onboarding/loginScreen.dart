

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  Map<String, String> FormValues = {"email":"", "password":""};
  bool Loading = false;

  InputOnchange(Mapkey, TextValue){
    setState(() {
      FormValues.update(Mapkey, (value) => TextValue);
    });
  }

  FormOnSubmit() async {
    if(FormValues["email"]! == 0){
      ErrorToast('email required');
    }
    if(FormValues["password"]! == 0){
      ErrorToast('password required');
    }
    else{
      setState(() {Loading = true;});
      bool res = await LoginRequest(FormValues);
      if(res == true){
        //navigate to dashboard
      }
      else{
        setState(() {Loading = false;});
      }
    }
  }

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
                Text('Get Started With', style: Head1Text(darkBlue),),
                const SizedBox(height: 1,),
                Text('Learn with Sazzad Hossain', style: Head6Text(lightGrey),),
                const SizedBox(height: 20,),

                TextFormField(
                  onChanged: (TextValue){
                    InputOnchange("email", TextValue);
                  },
                  decoration: AppInputDecoration('Email Address'),
                ),
                const SizedBox(height: 20,),

                TextFormField(
                  onChanged: (TextValue){
                    InputOnchange("password", TextValue);
                  },
                  decoration: AppInputDecoration('Password'),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FormOnSubmit();
                    },
                    child: Text('Login'),
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
