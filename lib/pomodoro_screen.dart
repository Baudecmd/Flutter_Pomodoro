import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/components/custom_app_bar.dart';
import 'package:pomodoro/components/square_button.dart';
import 'package:pomodoro/custom_timer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/model/method_rep.dart';
import 'package:pomodoro/model/method_state.dart';

class PomodoroScreen extends StatefulWidget {
  MethodRep method;
  PomodoroScreen({Key? key, required this.method}) : super(key: key);

  @override
  _PomodoroScreenState createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  var timeout = Duration(seconds: 3);
  late Timer _timer;

  late int workAmount;
  late int breakAmount;
  MethodState methodState = MethodState.WORK;

  @override
  void initState() {
    resetTimer();
    super.initState();
  }

  void resetTimer() {
    methodState = MethodState.WORK;

    workAmount = widget.method.workAmount;
    breakAmount = widget.method.breakAmount;
    startTimeout();
  }

  void startTimeout() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        print("tic tac");
        if (workAmount == 0 && breakAmount == 0) {
          setState(() {
            methodState = MethodState.OVER;

            timer.cancel();
          });
        } else if (workAmount == 0) {
          setState(() {
            breakAmount--;
            methodState = MethodState.BREAK;
          });
        } else {
          setState(() {
            workAmount--;
            methodState = MethodState.WORK;
          });
        }
      },
    );
  }

  String getStateMessage() {
    if (methodState == MethodState.WORK)
      return AppLocalizations.of(context)!.workStep;
    else if (methodState == MethodState.BREAK)
      return AppLocalizations.of(context)!.breakStep;
    else if (methodState == MethodState.OVER)
      return AppLocalizations.of(context)!.overStep;

    return "ERROR";
  }

  int getTimerValue() {
    if (methodState == MethodState.WORK)
      return workAmount;
    else if (methodState == MethodState.BREAK)
      return breakAmount;
    else if (methodState == MethodState.OVER) return 0;

    return 0;
  }

  void addTime() {
    if (methodState == MethodState.WORK)
      workAmount += 60;
    else if (methodState == MethodState.BREAK) breakAmount += 60;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppBar(
              bottomText: Text(""),
              backgroundColor: Theme.of(context).primaryColor,
              fontColor: Theme.of(context).accentColor,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(200, 101, 82, 100),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          getStateMessage(),
                          style: TextStyle(
                            fontSize: 30,
                            color: Theme.of(context).accentColor,
                          ),
                          textAlign: TextAlign.center,
                        )),
                    Container(
                        width: double.infinity,
                        child: CustomTimer(timeLeft: getTimerValue())),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                addTime();
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(200, 101, 82, 100),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Text(
                                    AppLocalizations.of(context)!.add1Minute,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor,
                                    )))),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                resetTimer();
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(200, 101, 82, 100),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Text("⟲",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Theme.of(context).accentColor,
                                    ))))
                      ],
                    ),
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SquareButton(
                        fontColor: Theme.of(context).primaryColor,
                        backgroundColor: Theme.of(context).accentColor,
                        onTap: () {
                          setState(() {
                            resetTimer();
                          });
                        },
                        text: AppLocalizations.of(context)!.workText,
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: 0,
                        isSelected: false),
                    SquareButton(
                        fontColor: Theme.of(context).primaryColor,
                        backgroundColor: Theme.of(context).accentColor,
                        onTap: () {
                          setState(() {
                            workAmount = 0;
                          });
                        },
                        text: AppLocalizations.of(context)!.breakText,
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: 0,
                        isSelected: false)
                  ],
                )),
            Align(
                alignment: Alignment.topRight,
                child: Container(
                    margin: EdgeInsets.only(right: 20, bottom: 20),
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(200, 101, 82, 100),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(AppLocalizations.of(context)!.continueText,
                        style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).accentColor,
                        ))))
          ],
        ),
      ),
    ));
  }
}
