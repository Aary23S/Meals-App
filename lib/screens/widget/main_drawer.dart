// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget 
{
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) 
  {
    return Drawer
    (
      child: Column
      (
        children: 
        [
          DrawerHeader
          (
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration
            (
              gradient: LinearGradient
              (
                colors: 
                [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row
            (
              children: 
              [
                Icon(Icons.fastfood, size: 48, color: Theme.of(context).colorScheme.onPrimaryContainer,),
                const SizedBox(width: 18,),
                Text("Cooking Up!", style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),),
              ],
            )
          ),
          ListTile 
          (
            leading: Icon(Icons.restaurant_menu_outlined,size:25,color: Theme.of(context).colorScheme.onSurface,),
            title: Text("Meals", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
            onTap: ()
            {
              // Navigator.of(context).pop();
              onSelectScreen("meals");
            }, 
          ),
          ListTile 
          (
            leading: Icon(Icons.filter,size:25,color: Theme.of(context).colorScheme.onSurface,),
            title: Text("Filter", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
            onTap: ()
            {
              // Navigator.of(context).pop();
              onSelectScreen("filter");
            }, 
          ),
          ListTile 
          (
            leading: Icon(Icons.settings,size:25,color: Theme.of(context).colorScheme.onSurface,),
            title: Text("Settings", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
            onTap: ()
            {
              // Navigator.of(context).pop();
              onSelectScreen("settings");
            }, 
          )
        ],
      )
    );
  }
}