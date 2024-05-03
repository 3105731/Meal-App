import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filters, bool> activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filters"),
      ),
      body: Column(
          children: [
            customSwitch(
              context,
              "Gluten-Free",
              "Only include gluten-free meals",
              activeFilters[Filters.glutenFree]!,
                  (bool value) {
                ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, value);
              },
            ),
            customSwitch(
              context,
              "Lactose-Free",
              "Only include lactose-free meals",
              activeFilters[Filters.lactoseFree]!,
                  (bool value) {
                    ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, value);
              },
            ),
            customSwitch(
              context,
              "Vegetarian-Free",
              "Only include vegetarian-free meals",
              activeFilters[Filters.vegetarianFree]!,
                  (bool value) {
                ref.read(filtersProvider.notifier).setFilter(Filters.vegetarianFree, value);
              },
            ),
            customSwitch(
              context,
              "Vegan-Free",
              "Only include vegan-free meals",
              activeFilters[Filters.veganFree]!,
                  (bool value) {
                ref.read(filtersProvider.notifier).setFilter(Filters.veganFree, value);
              },
            ),
          ],
        ),
    );
  }

  SwitchListTile customSwitch(
      BuildContext context,
      String title,
      String subtitle,
      bool filter,
      Function(bool newValue) onChanged,
      ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      activeColor: Theme.of(context).colorScheme.tertiary,
      value: filter,
      onChanged: onChanged,
    );
  }
}