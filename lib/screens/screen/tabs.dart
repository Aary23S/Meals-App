// ignore_for_file: avoid_print, deprecated_member_use, unused_local_variable, unused_field
import 'package:flutter/material.dart';
import 'package:shpoing_app/screens/data/dummy_data.dart';
import 'package:shpoing_app/screens/model/meals.dart';
import 'package:shpoing_app/screens/screen/category_screen.dart';
import 'package:shpoing_app/screens/screen/filters.dart';
import 'package:shpoing_app/screens/screen/meals.dart';
import 'package:shpoing_app/screens/widget/main_drawer.dart';

class TabScreen extends StatefulWidget 
{
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() => _TabScreenState();
}

final kInitialFilters = {
  Filters.glutenFree : false,
  Filters.vegetarian : false, 
  Filters.vegan : false,
  Filters.lactoseFree : false,
};
class _TabScreenState extends State<TabScreen> 
{
  int _selectedIndex=0;
  final List<Meal> _favouriteMeal = [];
  
  Map<Filters,bool> _selectedFilter =kInitialFilters;

  //this function helps to first check which meal is already in fav list or not
  // then add or remove accordingly
  void _toogeleMealFavStatus(Meal meal)
  {
    final isExisting = _favouriteMeal.contains(meal);
    setState((){
      if(isExisting){
        _favouriteMeal.remove(meal);
        _showInfoMessage('Meal removed from favorites.');
      } else {
        _favouriteMeal.add(meal);
        _showInfoMessage('Meal added to favorites.');
      }
    });
  }
  
  //snackbar to show info message
  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message),),
    );
  }

  //set the screen based on the index selected in bottom navigation bar
  void _selectPage(int index){
    setState((){
      _selectedIndex=index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _selectedFilter,),
        ),
      );      
      // print(result);

      setState(() {
        _selectedFilter=result ?? kInitialFilters;
      });
    }
  }

  
  
  
  @override
  Widget build(BuildContext context) 
  {
    
    final availableMeals=dummyMeals.where(
    (meal) {
      if(_selectedFilter[Filters.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilter[Filters.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilter[Filters.vegan]! && !meal.isVegan){
        return false;
      }
      if(_selectedFilter[Filters.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      return true;
    }
  ).toList();
    
    var activePgTitile='Categories';

    Widget activePage = CategoryScreen(onToggleFav: _toogeleMealFavStatus, availableMeals: availableMeals,);
    if(_selectedIndex==1){
      activePage=Meals( meals: _favouriteMeal, onToggleFav: _toogeleMealFavStatus,);
      activePgTitile='Your Favorites';
    }
    
    return Scaffold
    (
      appBar: AppBar(
        title: Text(activePgTitile),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar
      (
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: const 
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}