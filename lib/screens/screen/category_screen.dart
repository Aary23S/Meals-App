// ignore_for_file: unused_import, unused_local_variable

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shpoing_app/screens/data/dummy_data.dart';
import 'package:shpoing_app/screens/model/meals.dart';
import 'package:shpoing_app/screens/screen/meals.dart';
import 'package:shpoing_app/screens/widget/category_grid_item.dart';
import 'package:shpoing_app/screens/model/category.dart';

class CategoryScreen  extends StatelessWidget 
{
  const CategoryScreen ({super.key, required this.availableMeals});

  // final void Function(Meal meal) onToggleFav;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category)
  {
    final filteredMeals = availableMeals.where((meal)=> meal.categories.contains(category.id)).toList();
    Navigator.push(context, MaterialPageRoute(builder:(cxt) => 
    Meals(title: category.title, meals: filteredMeals,) ));
  }

  @override
  Widget build(BuildContext context) 
  {
    return GridView
      ( 
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
        (crossAxisCount: 2,childAspectRatio: 1.5, mainAxisSpacing: 15, crossAxisSpacing: 10),
        children: 
        [
          for(final category in availableCategories)
            CategoryGridItem(category: category, onSelectCategory: () => _selectCategory(context, category) ,),
        ],
      );
  }
}