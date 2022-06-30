import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  int timeLeft;
  CustomTimer({Key? key, required this.timeLeft}) : super(key: key);

  @override
  _CustomTimerState createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(width: 1.6, color: Theme.of(context).accentColor),
      ),
      child: Text(
        (widget.timeLeft/60).floor().toString().padLeft(2, '0')+":"+(widget.timeLeft-(widget.timeLeft/60).floor()*60).toString().padLeft(2, '0'),
        style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 40),
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.all(10),
    );
  }
}
