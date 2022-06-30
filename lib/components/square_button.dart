import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final Color backgroundColor;
  final Function onTap;
  final String text;
  final double width;
  final double padding;
  final bool isSelected;
  final Color fontColor;

  const SquareButton(
      {Key? key,
      required this.backgroundColor,
      required this.onTap,
      required this.text,
      required this.width,
      required this.padding,
      required this.isSelected,
      required this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          this.onTap();
        },
        child: Container(
          width: this.width,
          height: this.width,
          padding: EdgeInsets.all(this.padding),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(180, 90, 75, 100).withOpacity(0.8),
                  spreadRadius:1,
                  offset: Offset(0,7), // changes position of shadow
                ),
              ],
              color: this.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: this.isSelected ? 4 : 2,
                  color: Theme.of(context).accentColor)),
          child: Center(
              child: Text(
            this.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: this.fontColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          )),
        ));
  }
}
