import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n_ext.dart';
import '../../models/species.dart';

/// Bottom navigation (phone) or side rail (wide screens / web) around the
/// five main sections: dashboard, the three species modules, settings.
class HomeShell extends StatelessWidget {
  const HomeShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  void _go(int index) =>
      shell.goBranch(index, initialLocation: index == shell.currentIndex);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final destinations = [
      (Icons.dashboard_outlined, l10n.navDashboard),
      for (final s in Species.values) (s.icon, s.label(l10n)),
      (Icons.settings_outlined, l10n.navSettings),
    ];
    final wide = MediaQuery.sizeOf(context).width >= 720;

    if (wide) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: shell.currentIndex,
              onDestinationSelected: _go,
              labelType: NavigationRailLabelType.all,
              destinations: [
                for (final (icon, label) in destinations)
                  NavigationRailDestination(
                    icon: Icon(icon),
                    label: Text(label),
                  ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: shell),
          ],
        ),
      );
    }
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: _go,
        destinations: [
          for (final (icon, label) in destinations)
            NavigationDestination(icon: Icon(icon), label: label),
        ],
      ),
    );
  }
}
