// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shpoing_app/screens/model/meals.dart';
import 'package:shpoing_app/screens/screen/meals_details.dart';
import 'package:shpoing_app/screens/widget/meal_item.dart';

class Meals extends StatelessWidget 
{
  const Meals({super.key, this.title, required this.meals, required this.onToggleFav});

  final String? title;
  final List<Meal> meals; 
  final void Function(Meal meal) onToggleFav;

  void selectMeal(BuildContext context, Meal meal)
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> 
    MealsDetails(meal: meal, onToggleFav: onToggleFav,),),);
  }
  
  @override
  Widget build(BuildContext context) 
  {
    Widget content;
    if(meals.isEmpty)
    {
      content = Center
      (
        child: Column
        (
          mainAxisSize: MainAxisSize.min,
          children: 
          [
            
            Text("No meals found!", style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),),
            const SizedBox(height: 16,),
            Text("Try selecting a different category!", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),),
          ],
        ),
      );
    }
    else
    {
      content = ListView.builder
      (
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index], onSelectMeal: selectMeal,),
      );
    }

    if(title==null){
      return content;
    }

    return Scaffold
    (
      appBar: AppBar
      (
        title: Text(title!),
      ),
      body: content,
    );
  }
}