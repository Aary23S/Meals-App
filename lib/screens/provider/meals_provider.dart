// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shpoing_app/screens/data/dummy_data.dart';

final mealsProvider =Provider
(
  (ref) {
    // Your provider logic here
    return dummyMeals;
  },
);