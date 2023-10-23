import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {

  final Function(int) onChange;
  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {

  int _gender = 0;

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
      topColor: Colors.white,
      backColor: Colors.grey[350]!,
      borderRadius: BorderRadius.circular(15)
  );
  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.grey[200]!,
      backColor: Colors.grey,
      borderRadius: BorderRadius.circular(15)
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              border: Border.all(color: Colors.grey),
              style: _gender == 1? selectedStyle : unselectedStyle,
              onSelected: () {
                _gender = 1;
                setState(() {});
                widget.onChange(_gender);
              },
              onUnSelected: () {},
              selected: _gender == 1,
              child: Padding(
                padding: EdgeInsets.only(top: 2),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/male.jpeg',
                      width: 50,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Male')
                  ],
                ),
              )),
          SizedBox(width: 30,),

          ChoiceChip3D(
              border: Border.all(color: Colors.grey),
              style: _gender == 2? selectedStyle : unselectedStyle,
              onSelected: () {
                _gender = 2;
                setState(() {});
                widget.onChange(_gender);
              },
              onUnSelected: () {},
              selected: _gender == 2,
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/f1.jpeg',
                      width: 58,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Female')
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
