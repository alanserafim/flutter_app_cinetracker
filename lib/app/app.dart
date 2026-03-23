import 'package:flutter/material.dart';
import '../view/screens/home_page.dart';

class CineTrack extends StatelessWidget {
  const CineTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "cinetrack",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}