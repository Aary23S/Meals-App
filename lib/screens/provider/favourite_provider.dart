// ignore_for_file: unused_import, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shpoing_app/screens/model/meals.dart';


class FavouriteProvider extends StateNotifier<List<Meal>> {
  FavouriteProvider() : super([]);

  bool toggleFavourite(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }

}

final favouriteMealsProvider = StateNotifierProvider<FavouriteProvider, List<Meal>>(
  (ref){
    return FavouriteProvider();
  }
);