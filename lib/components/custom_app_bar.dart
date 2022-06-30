import 'package:flutter/material.dart';
import 'package:pomodoro/components/logo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatefulWidget {
  Text bottomText;
  Color backgroundColor;
  Color fontColor;

  CustomAppBar(
      {Key? key,
      required this.bottomText,
      required this.backgroundColor,
      required this.fontColor})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Logo(),
              ),
              Text(
                AppLocalizations.of(context)!.appTitle,
                style: TextStyle(
                    fontSize: 32, color: widget.fontColor),
              )
            ],
          ),
          Container(margin: EdgeInsets.only(top: 25), child: widget.bottomText)
        ],
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(color: widget.backgroundColor, width: 30),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
