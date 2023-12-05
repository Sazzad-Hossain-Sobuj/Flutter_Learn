import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../style/style.dart';

class splasScreen extends StatefulWidget {
  const splasScreen({Key? key}) : super(key: key);

  @override
  State<splasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<splasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: SvgPicture.asset('assets/images/app_logo.svg',alignment: Alignment.center,),
            ),
          )
        ]
      ),
    );
  }
}
