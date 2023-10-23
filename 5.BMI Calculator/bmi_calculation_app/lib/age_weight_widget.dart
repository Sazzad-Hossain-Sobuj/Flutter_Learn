import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const AgeWeightWidget(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.initValue;

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.remove,color: Colors.white,),
                    ),
                    onTap: (){
                      if(counter > widget.min){
                        counter--;
                      }
                      setState(() {});
                      widget.onChange(counter);
                    },
                  ),
                  SizedBox(width: 10,),
                  Text(counter.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(width: 10,),

                  InkWell(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.add,color: Colors.white,),
                    ),
                    onTap: (){
                      if(counter < widget.max){
                        counter++;
                      }
                      setState(() {});
                      widget.onChange(counter);
                    },
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
