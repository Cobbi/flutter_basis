import 'package:flutter/material.dart';
// import 'package:learnflutter/pages/counter_page.dart';
// import 'package:learnflutter/pages/first_page.dart';
import 'package:learnflutter/pages/homepage.dart';
import 'package:learnflutter/pages/profilepage.dart';
import 'package:learnflutter/pages/settingspage.dart';
import 'package:learnflutter/pages/simple_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // Directly open FirstPage as the home
        home: const Calculator(),
        routes: {
          '/homepage': (context) => const HomePage(),
          '/settingspage': (context) => const SettingsPage(),
          '/profilepage': (context) => const Profilepage(),
        });
  }
}
