// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpoing_app/screens/home/my_app.dart';

final theme = ThemeData
(
  
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed
  (
    seedColor: Color.fromARGB(255, 131,57, 0),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main()
{
  runApp(const MyApp());
}

