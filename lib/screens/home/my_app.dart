// ignore_for_file: unused_element, unused_import

import 'package:flutter/material.dart';
import 'package:shpoing_app/screens/screen/meals.dart';
import 'package:shpoing_app/screens/screen/tabs.dart';
import 'package:shpoing_app/theme.dart';
import 'package:shpoing_app/screens/screen/category_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
{
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home:const TabScreen(),
    );
    
  }
}