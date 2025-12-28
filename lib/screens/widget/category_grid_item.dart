// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shpoing_app/screens/model/category.dart';


class CategoryGridItem extends StatelessWidget 
{
  const CategoryGridItem({super.key,required this.category,required this.onSelectCategory});

  final Category category; 
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) 
  {
    return InkWell
    (
      onTap: onSelectCategory,
      // splashColor: ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container
      (
        padding: const EdgeInsets.all(24),
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration
        (
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient
          (
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: 
            [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
          )
        ),
        child: Text
        (
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith
          (
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      )
    );
    
  }
}

