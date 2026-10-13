import 'package:flutter/material.dart';

/// The animal species the app supports. Each one is a separate module; adding a
/// new species (ducks, turkeys, goats...) starts by adding a value here.
enum Species {
  quail(icon: Icons.egg_outlined, laysEggs: true),
  chicken(icon: Icons.egg_alt_outlined, laysEggs: true),
  rabbit(icon: Icons.cruelty_free_outlined, laysEggs: false);

  const Species({required this.icon, required this.laysEggs});

  final IconData icon;
  final bool laysEggs;
}

enum FlockPurpose { eggs, meat, breeding }
