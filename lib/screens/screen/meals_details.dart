import 'package:flutter/material.dart';
import 'package:shpoing_app/screens/model/meals.dart';

class MealsDetails extends StatelessWidget 
{
  const MealsDetails({super.key, required this.meal, required this.onToggleFav});

  final Meal meal;
  final void Function(Meal meal) onToggleFav;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text(meal.title),
        actions: 
        [
          IconButton(onPressed: (){
            onToggleFav(meal);
          }, icon: Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView
      (
        child: Column
        (
          children: 
          [
            Image.network(meal.imageUrl,fit:BoxFit.cover,width:double.infinity,height:300,),
            const SizedBox(height: 20,),
            Text
            (
              "Details for ${meal.title}", style: Theme.of(context).textTheme.headlineMedium!.copyWith( color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            for(final ingredient in meal.ingredients)
              Text(ingredient, style: Theme.of(context).textTheme.bodyLarge!.copyWith( color: Theme.of(context).colorScheme.onSurface)),
            const SizedBox(height: 20,),
            Text
            (
              "Steps", style: Theme.of(context).textTheme.headlineMedium!.copyWith( color: Theme.of(context).colorScheme.primary)
              ,textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            for(final step in meal.steps)
              Padding
              (
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(step, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge!.copyWith( color: Theme.of(context).colorScheme.onSurface)),
              ),

          ],
        ),
      ),

    );
  }
}