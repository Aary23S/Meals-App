// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:shpoing_app/screens/model/meals.dart';
// import 'package:shpoing_app/screens/screen/meals.dart';
import 'package:shpoing_app/screens/screen/tabs.dart';
import 'package:shpoing_app/screens/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shpoing_app/screens/provider/filters_provider.dart';
// import 'package:shpoing_app/screens/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filters.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.glutenFree, isChecked);
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only include gluten-free meals.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.vegetarian, isChecked);
            },
            title: Text(
              "Vegetarian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only include vegeterian meals.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.vegan, isChecked);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only include Vegan meals.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filters.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.lactoseFree, isChecked);
            },
            title: Text(
              "Lactose-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only include lactose-free meals.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}