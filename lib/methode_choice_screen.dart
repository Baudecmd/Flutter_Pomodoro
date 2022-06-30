import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/components/custom_app_bar.dart';
import 'package:pomodoro/components/logo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/components/square_button.dart';
import 'package:pomodoro/model/method_rep.dart';
import 'package:pomodoro/pomodoro_screen.dart';

class MethodChoiceScreen extends StatefulWidget {
  MethodChoiceScreen({Key? key}) : super(key: key);

  @override
  _MethodChoiceScreenState createState() => _MethodChoiceScreenState();
}

class _MethodChoiceScreenState extends State<MethodChoiceScreen> {
  late MethodRep choosedMethod;
  int indexOfChoosedRep = 0;
  List<MethodRep> getAllMethod() {
    return [
      new MethodRep(15*60, 5*60),
      new MethodRep(20*60, 5*60),
      new MethodRep(30*60, 5*60),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<MethodRep> allMethod = getAllMethod();
    return Scaffold(
        body: Container(
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAppBar(
                      bottomText: Text(
                        AppLocalizations.of(context)!.methodBottomBarText,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      backgroundColor: Theme.of(context).accentColor,
                      fontColor: Theme.of(context).primaryColor,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.width * 0.92,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SquareButton(
                                backgroundColor: Colors.green,
                                onTap: () {
                                  setState(() {
                                    choosedMethod = allMethod[0];
                                    indexOfChoosedRep = 0;
                                    print(choosedMethod);
                                  });
                                },
                                text: "✍️ 15 min\n\n📴 5 min",
                                width: MediaQuery.of(context).size.width * 0.44,
                                padding: 0,
                                isSelected: indexOfChoosedRep == 0,
                                fontColor: Theme.of(context).accentColor,
                              ),
                              SquareButton(
                                backgroundColor: Colors.orange,
                                onTap: () {
                                  setState(() {
                                    choosedMethod = allMethod[1];
                                    indexOfChoosedRep = 1;

                                    print(choosedMethod);
                                  });
                                },
                                text: "✍️ 20 min\n\n📴 5 min",
                                width: MediaQuery.of(context).size.width * 0.44,
                                padding: 0,
                                isSelected: indexOfChoosedRep == 1,
                                fontColor: Theme.of(context).accentColor,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SquareButton(
                                backgroundColor: Colors.red,
                                onTap: () {
                                  setState(() {
                                    choosedMethod = allMethod[2];
                                    indexOfChoosedRep = 2;

                                    print(choosedMethod);
                                  });
                                },
                                text: "✍️ 30 min\n\n📴 5 min",
                                width: MediaQuery.of(context).size.width * 0.44,
                                padding: 0,
                                isSelected: indexOfChoosedRep == 2,
                                fontColor: Theme.of(context).accentColor,
                              ),
                              SquareButton(
                                backgroundColor: Colors.blue,
                                onTap: () {
                                  print("todo pas encore implémenté");
                                },
                                text: AppLocalizations.of(context)!.customize,
                                width: MediaQuery.of(context).size.width * 0.44,
                                padding: 0,
                                isSelected: false,
                                fontColor: Theme.of(context).accentColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PomodoroScreen(
                                            method: choosedMethod,
                                          )));
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 20, bottom: 20),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(200, 101, 82, 100),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Text(
                                    AppLocalizations.of(context)!.continueText,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Theme.of(context).accentColor,
                                    )))))
                  ]),
            )));
  }
}
