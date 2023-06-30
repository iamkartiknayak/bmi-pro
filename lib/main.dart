import 'package:flutter/material.dart';

import './screens/input_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0e21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
          elevation: 0.0,
          centerTitle: true,
        ),
      ),
      home: const InputPage(),
    );
  }
}
