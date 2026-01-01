// ignore_for_file: avoid_print, deprecated_member_use, unused_local_variable, unused_field, unused_element
import 'package:flutter/material.dart';
// import 'package:shpoing_app/screens/data/dummy_data.dart';
// import 'package:shpoing_app/screens/model/meals.dart';
import 'package:shpoing_app/screens/screen/category_screen.dart';
import 'package:shpoing_app/screens/screen/filters.dart';
import 'package:shpoing_app/screens/screen/meals.dart';
import 'package:shpoing_app/screens/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shpoing_app/screens/provider/favourite_provider.dart';
import 'package:shpoing_app/screens/provider/filters_provider.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filterMealsProvider);

    var activePgTitile = 'Categories';
    Widget activePage = CategoryScreen(
      availableMeals: availableMeals,
    );

    if (_selectedIndex == 1) {
      final favouriteMeal = ref.watch(favouriteMealsProvider);
      activePage = Meals(
        meals: favouriteMeal,
      );
      activePgTitile = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePgTitile),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: const [
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