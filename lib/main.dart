import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petnow/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Now',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.montserratAlternatesTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
