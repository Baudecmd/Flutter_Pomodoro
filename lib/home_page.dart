import 'dart:async';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import 'custom_timer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var timeout = Duration(seconds: 3);
  var ms = Duration(milliseconds: 1);
  late Timer _timer;
  int _start = 10;

  void startTimeout() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: Container(
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.asset("assets/tomato_logo.png"),
                      ),
                      Text(AppLocalizations.of(context)!.appTitle,
                          style: Theme.of(context).textTheme.headline6),
                      CustomTimer(timeLeft: _start),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                startTimeout();
                              },
                              child: Text("hrllo")),
                          ElevatedButton(
                              onPressed: () {
                                startTimeout();
                              },
                              child: Text("hrllo"))
                        ],
                      )
                    ]))));
  }
}

//Text(AppLocalizations.of(context)!.helloWorld)