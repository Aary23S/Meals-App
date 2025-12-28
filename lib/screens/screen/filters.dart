// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
// import 'package:shpoing_app/screens/screen/meals.dart';
import 'package:shpoing_app/screens/screen/tabs.dart';
import 'package:shpoing_app/screens/widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget 
{
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filters{
    glutenFree,
    vegetarian,
    vegan,
    lactoseFree
}

class _FiltersScreenState extends State<FiltersScreen> 
{  
  
  var _glutenFreeSet = false;
  var _vegetarianSet = false;
  var _veganSet = false;
  var _lactoseFreeSet = false;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar:AppBar
      (
        title: const Text("Your Filters"),
      ),
      drawer: MainDrawer(onSelectScreen: (identifier){
        Navigator.of(context).pop();
        if(identifier == 'meals'){
          Navigator.of(context).pushReplacement(MaterialPageRoute
          (builder: (ctx)=> TabScreen()));
        } 
      },),
      body:WillPopScope
      (
        // canPop: true,
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glutenFree : _glutenFreeSet,
            Filters.vegetarian : _vegetarianSet, 
            Filters.vegan : _veganSet,
            Filters.lactoseFree : _lactoseFreeSet,
          });
          return false;
        },
        child: Container
        (
          child: Column
          (
            children: 
            [
              SwitchListTile
              (
                value: _glutenFreeSet, 
                onChanged: (isChecked){
                  setState(() {
                    _glutenFreeSet = isChecked;
                  });
                },
                title: Text("Gluten-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
                subtitle: Text("Only include gluten-free meals.", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
              ),
              SwitchListTile
              (
                value: _vegetarianSet, 
                onChanged: (isChecked){
                  setState(() {
                    _vegetarianSet = isChecked;
                  });
                },
                title: Text("Vegetarian", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
                subtitle: Text("Only include vegeterian meals.", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
              ),
              SwitchListTile
              (
                value: _veganSet, 
                onChanged: (isChecked){
                  setState(() {
                    _veganSet = isChecked;
                  });
                },
                title: Text("Vegan", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
                subtitle: Text("Only include Vegan meals.", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
              ),
              SwitchListTile
              (
                value: _lactoseFreeSet, 
                onChanged: (isChecked){
                  setState(() {
                    _lactoseFreeSet = isChecked;
                  });
                },
                title: Text("Lactose-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
                subtitle: Text("Only include Lactose-free meals.", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
              )
            ],
          ),
        ),
      )
    );
  }
}