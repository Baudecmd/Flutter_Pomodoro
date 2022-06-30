import 'package:flutter/material.dart';
import 'package:pomodoro/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'methode_choice_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ""),
        const Locale('fr', ""),
      ],
      theme: ThemeData(
            brightness: Brightness.light,
        primaryColor: const Color(0xFFF97762),
        accentColor: const Color(0xFFFCEDDA),
      
        textTheme: const TextTheme(
          headline5: TextStyle(fontSize: 20.0,color: Colors.black),
          headline6:TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,color:const Color(0xFFEE4E34)),
        )
      ),
      home: MethodChoiceScreen(),
    );
  }
}
