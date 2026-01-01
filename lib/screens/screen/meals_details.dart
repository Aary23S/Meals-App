// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:shpoing_app/screens/model/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shpoing_app/screens/provider/favourite_provider.dart';
class MealsDetails extends ConsumerWidget 
{
  const MealsDetails({super.key, required this.meal});

  final Meal meal;
  // final void Function(Meal meal) onToggleFav;

  @override
  Widget build(BuildContext context, WidgetRef ref) 
  {
    final favMeal = ref.watch(favouriteMealsProvider);
    final  isFav=favMeal.contains(meal);

    return Scaffold
    (
      appBar: AppBar
      (
        title: Text(meal.title),
        actions: 
        [
          IconButton(onPressed: (){
            // onToggleFav(meal);
            final isAddedtoFav=ref.read(favouriteMealsProvider.notifier).toggleFavourite(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(isAddedtoFav ? 'Meal added in Favourite' : 'Meal removed from Favourite'),),
          );
          }, icon: Icon(isFav?Icons.star:Icons.star_border),),
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