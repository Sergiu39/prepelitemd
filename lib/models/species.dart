import 'package:flutter/material.dart';

/// The two big groups shown on the start page.
enum SpeciesGroup {
  birds(icon: Icons.flutter_dash),
  animals(icon: Icons.cruelty_free_outlined);

  const SpeciesGroup({required this.icon});

  final IconData icon;

  List<Species> get species =>
      Species.values.where((s) => s.group == this).toList();
}

/// The animal species the app supports. Each one is a separate module; adding a
/// new species (ducks, turkeys, goats...) starts by adding a value here.
enum Species {
  quail(icon: Icons.egg_outlined, group: SpeciesGroup.birds, laysEggs: true),
  chicken(
    icon: Icons.egg_alt_outlined,
    group: SpeciesGroup.birds,
    laysEggs: true,
  ),
  rabbit(
    icon: Icons.cruelty_free_outlined,
    group: SpeciesGroup.animals,
    laysEggs: false,
  );

  const Species({
    required this.icon,
    required this.group,
    required this.laysEggs,
  });

  final IconData icon;
  final SpeciesGroup group;
  final bool laysEggs;
}

enum FlockPurpose { eggs, meat, breeding }
