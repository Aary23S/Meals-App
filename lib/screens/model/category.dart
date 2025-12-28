import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Category 
{
  Category({required this.id, required this.title, this.color=Colors.deepOrangeAccent});
  
  final String id;
  final String title;
  final Color color;
}